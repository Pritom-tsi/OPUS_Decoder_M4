/**
  ******************************************************************************
  * @file    opus_interface.c
  * @author  SRA 
  * @brief   this file contains a set of API to easily use Opus.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0094, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0094
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "opus_interface.h"

/** @addtogroup OPT
  * @{
  */

/** @defgroup OPT_OPUS_INTERFACE OPT_OPUS_INTERFACE
  * @{
  */

/** @defgroup OPT_OPUS_INTERFACE_Private_Types OPT_OPUS_INTERFACE_Private_Types
* @{
*/

/* Private typedef -----------------------------------------------------------*/
/**
 * @brief OPUS_Handle structure definition
 */
typedef struct
{
  uint16_t ENC_frame_size;      /*!< Specifies the encoder frame size. */
  
  uint16_t DEC_frame_size;      /*!< Specifies the decoder frame size. */
  
  uint16_t max_enc_frame_size;  /*!< Maximum size of the encoder frame. */
  
  OpusEncoder *Encoder;         /*!< Opus encoder. */
  
  uint8_t ENC_configured;       /*!< Specifies if the Encoder is configured. */
  
  OpusDecoder *Decoder;         /*!< Opus decoder. */
  
  uint8_t DEC_configured;       /*!< Specifies if the Decoder is configured. */

} OPUS_HandleTypeDef;

/**
  * @}
  */

/* Private defines -----------------------------------------------------------*/
/* Private macros ------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

/** @defgroup OPT_OPUS_INTERFACE_Private_Variable OPT_OPUS_INTERFACE_Private_Variable
  * @{
  */

static OPUS_HandleTypeDef hOpus = {.ENC_configured = 0, .DEC_configured = 0};

/**
  * @}
  */

/* Global variables ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/

/** @defgroup OPT_OPUS_INTERFACE_Exported_Functions OPT_OPUS_INTERFACE_Exported_Functions
  * @{
  */

/* Functions Definition ------------------------------------------------------*/
/**
 * @brief  This function returns the amount of memory required for the current encoder setup.
 * @param  Opus encoder configuration.
 * @retval Number of byte.
 */
uint32_t ENC_Opus_getMemorySize(ENC_Opus_ConfigTypeDef *EncConfigOpus) 
{  
  uint32_t tot_enc_size = (EncConfigOpus->bitrate/8/((uint16_t)(1000.0f/EncConfigOpus->ms_frame)))*2;
   
  return tot_enc_size;
}
 
/**
 * @brief  This function returns the amount of memory required for the current decoder setup.
 * @param  Opus decoder configuration.
 * @retval Number of byte.
 */
uint32_t DEC_Opus_getMemorySize(DEC_Opus_ConfigTypeDef *DecConfigOpus) 
{
  uint32_t tot_dec_size = ((uint32_t)(((float)(DecConfigOpus->sample_freq/1000))*DecConfigOpus->ms_frame))*DecConfigOpus->channels * 2;
  
  return tot_dec_size;
}

/**
 * @brief  Encoder initialization.
 * @param  Opus encoder configuration.
 * @param  opus_err: @ref opus_errorcodes
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Init(ENC_Opus_ConfigTypeDef *ENC_configOpus,  int *opus_err) 
{
  Opus_Status status;
  *opus_err = 0;
  
  hOpus.ENC_frame_size = (uint16_t)(((float)(ENC_configOpus->sample_freq/1000))*ENC_configOpus->ms_frame);

  hOpus.max_enc_frame_size = (ENC_configOpus->bitrate/8/((uint16_t)(1000.0f/ENC_configOpus->ms_frame)))*2;
    
  /*Encoder Init*/
  hOpus.Encoder = opus_encoder_create(ENC_configOpus->sample_freq, ENC_configOpus->channels, ENC_configOpus->application, opus_err);

  if (*opus_err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  
  /*Bitrate set*/
  status = ENC_Opus_Set_Bitrate(ENC_configOpus->bitrate, opus_err);
  if (status != OPUS_SUCCESS)
  {
    return OPUS_ERROR;
  }
  
  /*Complexity set*/
  status = ENC_Opus_Set_Complexity(ENC_configOpus->complexity, opus_err);
  if (status != OPUS_SUCCESS) 
  {
    return OPUS_ERROR;
  }
  
  hOpus.ENC_configured = 1;

  return OPUS_SUCCESS;
}

/**
 * @brief  Encoder deinit function.
 * @param  None.
 * @retval None.
 */
void ENC_Opus_Deinit(void)
{
  opus_encoder_destroy(hOpus.Encoder);
  hOpus.ENC_configured = 0;
  hOpus.ENC_frame_size = 0;
  hOpus.max_enc_frame_size = 0;
}

/**
  * @brief  This function returns if the the Opus Encoder is configured.
  * @param  None.
  * @retval uint8_t: 1 if the Encoder is configured 0 otherwise.
  */
uint8_t ENC_Opus_IsConfigured(void)
{
 return hOpus.ENC_configured;
}

/**
 * @brief  Decoder initialization.
 * @param  Opus decoder configuration.
 * @param  opus_err: @ref opus_errorcodes
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status DEC_Opus_Init(DEC_Opus_ConfigTypeDef *DEC_configOpus, int *opus_err) 
{
  *opus_err = 0;
  hOpus.DEC_frame_size = ((uint32_t)(((float)(DEC_configOpus->sample_freq/1000))*DEC_configOpus->ms_frame));

  /*Decoder Init*/
  hOpus.Decoder = opus_decoder_create(DEC_configOpus->sample_freq, DEC_configOpus->channels, opus_err);
  
  if (*opus_err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  
  hOpus.DEC_configured = 1;

  return OPUS_SUCCESS;
}

/**
 * @brief  Decoder deinit function.
 * @param  None.
 * @retval None.
 */
void DEC_Opus_Deinit(void) 
{ 
  opus_decoder_destroy(hOpus.Decoder);
  
  hOpus.DEC_configured = 0;
  hOpus.DEC_frame_size = 0;
}

/**
  * @brief  This function returns if the the Opus Decoder is configured.
  * @param  None.
  * @retval uint8_t: 1 if the Decoder is configured 0 otherwise.
  */
uint8_t DEC_Opus_IsConfigured(void)
{
 return hOpus.DEC_configured;
}

/**
 * @brief  Set bitrate to be used for encoding
 * @param  bitrate: Indicate the bitrate in bit per second.
 * @param  opus_err: @ref opus_errorcodes
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Set_Bitrate(int bitrate, int *opus_err) 
{
  /*set Opus bitrate*/
  *opus_err = opus_encoder_ctl(hOpus.Encoder, OPUS_SET_BITRATE(bitrate));
  
  if(*opus_err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}

/**
 * @brief  Set constant bitrate option for the encoder.
 * @param  None.
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Set_CBR(void) 
{
  /*set Opus bitrate*/
  int err = opus_encoder_ctl(hOpus.Encoder, OPUS_SET_VBR(0));
  
  if (err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}

/**
 * @brief  Set variable bitrate option for the encoder.
 * @param  None.
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Set_VBR(void) 
{
  /*set Opus bitrate*/
  int err = opus_encoder_ctl(hOpus.Encoder, OPUS_SET_VBR(1));
  
  if (err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}
  
/**
 * @brief  Set complexity to be used for encoding
 * @param  complexity: value from o to 10.
 * @param  opus_err: @ref opus_errorcodes
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Set_Complexity(int complexity, int *opus_err) 
{
  /*set Opus complexity*/
  *opus_err = opus_encoder_ctl(hOpus.Encoder, OPUS_SET_COMPLEXITY(complexity));
  
  if (*opus_err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}

/**
 * @brief  Force the ecnoder to use only SILK
 * @param  None.
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Force_SILKmode(void) 
{
  int err = opus_encoder_ctl(hOpus.Encoder, OPUS_SET_FORCE_MODE(MODE_SILK_ONLY));
  
  if (err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}

/**
 * @brief  Force the ecnoder to use only CELT
 * @param  None.
 * @retval BV_Status: Value indicating success or error.
 */
Opus_Status ENC_Opus_Force_CELTmode(void) 
{
  int err =  opus_encoder_ctl(hOpus.Encoder, OPUS_SET_FORCE_MODE(MODE_CELT_ONLY));
  
  if (err != OPUS_OK) 
  {
    return OPUS_ERROR;
  }
  return OPUS_SUCCESS;
}

/**
 * @brief  Encoding functions
 * @param  buf_in: pointer to the PCM buffer to be encoded.
 * @param  buf_out: pointer to the Encoded buffer.
 * @retval Number of bytes in case of success, 0 viceversa.
 */
int ENC_Opus_Encode(uint8_t * buf_in, uint8_t * buf_out) 
{
  return opus_encode(hOpus.Encoder, (opus_int16 *) buf_in, hOpus.ENC_frame_size, (unsigned char *) buf_out, (opus_int32) hOpus.max_enc_frame_size);
}

/**
 * @brief  Decoding functions
 * @param  buf_in: pointer to the Encoded buffer to be decoded.
 * @param  len: length of the buffer in.
 * @param  buf_out: pointer to the Decoded buffer.
 * @retval Number of decoded samples or @ref opus_errorcodes.
 */
int DEC_Opus_Decode(uint8_t * buf_in, uint32_t len, uint8_t * buf_out) 
{
  return opus_decode(hOpus.Decoder, (unsigned char *) buf_in, (opus_int32) len, (opus_int16 *) buf_out, hOpus.DEC_frame_size, 0);
}

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
