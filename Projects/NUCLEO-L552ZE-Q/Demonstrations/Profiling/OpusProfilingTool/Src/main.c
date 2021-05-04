/**
  ******************************************************************************
  * @file    main.c
  * @author  SRA
  * @brief   This software provides an example application running on STM32 to
  *          demonstrate and profile Opus encoding and decoding.
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
#include "cube_hal.h"
#include "opus_interface.h"
//#include "stcmdp_manager.h" // commented out by Pritom
//#include "uart_protocol_interface.h"// commented out by Pritom

/* Private typedef -----------------------------------------------------------*/
/* Private defines -----------------------------------------------------------*/
/* Private macros ------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Global variables ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void ICACHE_Init(void);


ENC_Opus_ConfigTypeDef EncConfigOpus;   /*!< opus encode configuration.*/
DEC_Opus_ConfigTypeDef DecConfigOpus;   /*!< opus decode configuration.*/



/* Functions Definition ------------------------------------------------------*/
/**
 * @brief  Main program.
 * @param  None.
 * @retval None.
 */

//Added By Pritom
/* Private typedef -----------------------------------------------------------*/
/* Private defines -----------------------------------------------------------*/
#define SILK_MODE       0x00
#define HYBRID_MODE     0x01
#define CELT_MODE       0x02

#define TMsg_MaxLen        24576   /*!< Message length */
typedef struct
{
  uint32_t Len;                                 /*!< Message length           */
  uint8_t Data[TMsg_MaxLen];                    /*!< Message data             */
} TMsg;

/* Exported types ------------------------------------------------------------*/
typedef enum
{
  OPT_SUCCESS = 1,
  OPT_ERROR = 0
} OPT_StatusTypeDef;

/* Exported constants --------------------------------------------------------*/
/* External variables --------------------------------------------------------*/
/* Exported macros -----------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
OPT_StatusTypeDef InitOpusEncoder(TMsg *Msg);
OPT_StatusTypeDef InitOpusDecoder(TMsg *Msg);
OPT_StatusTypeDef ResetOpus(TMsg *Msg);
//OPT_StatusTypeDef Handle_CMD_EncDec_NoFile_Request(TMsg *Msg);
OPT_StatusTypeDef Handle_CMD_EncDec_File_Request(TMsg *Msg);




//uint32_t led_toggle_count = 0;//commented out by Pritom
int main(void)
{
  /* STM32Cube HAL library initialization:
   *  - Configure the Flash prefetch, Flash preread and Buffer caches
   *  - Systick timer is configured by default as source of time base, but user
   *    can eventually implement his proper time base source (a general purpose
   *    timer for example or other time source), keeping in mind that Time base
   *    duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and
   *    handled in milliseconds basis.
   *  - Low Level Initialization
   */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  ICACHE_Init();
  
  /* Configure LED */
  BSP_LED_Init(LED1);

  /* Configure UART */
  //USARTConfig(); //commented out by Pritom

  while (1)
  {
   // STCmdP_manager();
 //commented out by Pritom
  /*  if(led_toggle_count > 200)
    {   
      led_toggle_count = 0;
      BSP_LED_Toggle(LED1);
    }*/
  }
}

/**
  * @brief  System Clock Configuration
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE0) != HAL_OK)
  {
    while(1);
  }
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 55;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    while(1);
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    while(1);
  }
}

/**
  * @brief ICACHE Initialization Function
  * @param None
  * @retval None
  */
static void ICACHE_Init(void)
{

  /** Enable instruction cache in 1-way (direct mapped cache)
  */
  if (HAL_ICACHE_ConfigAssociativityMode(ICACHE_1WAY) != HAL_OK)
  {
    while(1);
  }
  if (HAL_ICACHE_Enable() != HAL_OK)
  {
    while(1);
  }
}

void HAL_MspInit(void)
{
  __HAL_RCC_SYSCFG_CLK_ENABLE();
  __HAL_RCC_PWR_CLK_ENABLE();


  /** Disable the internal Pull-Up in Dead Battery pins of UCPD peripheral
  */
  HAL_PWREx_DisableUCPDDeadBattery();
}



//Added by Pritom
OPT_StatusTypeDef InitOpusDecoder(TMsg *Msg)
{
  Opus_Status status;

  if(DEC_Opus_IsConfigured())
  {
    return OPT_ERROR;
  }

  DecConfigOpus.channels = Msg->Data[9];
  DecConfigOpus.ms_frame = (float)Msg->Data[3];
  DecConfigOpus.ms_frame += (float)(Msg->Data[4]/10.0f);
  DecConfigOpus.sample_freq = STCmdP_Deserialize(&Msg->Data[5], 4);

  uint32_t dec_size = DEC_Opus_getMemorySize(&DecConfigOpus);

  DecConfigOpus.pInternalMemory = (uint8_t *)malloc(dec_size);

  int opus_err;
  status = DEC_Opus_Init(&DecConfigOpus, &opus_err);

  if(status != OPUS_SUCCESS)
  {
    return OPT_ERROR;
  }

  return OPT_SUCCESS;
}

//Added By Pritom

/**
 * @brief  Handle destroy opus ecoder and decoder command.
 * @param  Message received.
 * @retval OPT_SUCCESS in case of success OPT_ERROR otherwise.
 */
OPT_StatusTypeDef ResetOpus(TMsg *Msg)
{
	//Commented out by Pritom
 /* if(ENC_Opus_IsConfigured())
  {
    ENC_Opus_Deinit();
    free(EncConfigOpus.pInternalMemory);
    memset(&EncConfigOpus, 0, sizeof(EncConfigOpus));
  }*/
  if(DEC_Opus_IsConfigured())
  {
    DEC_Opus_Deinit();
    free(DecConfigOpus.pInternalMemory);
    memset(&DecConfigOpus, 0, sizeof(DecConfigOpus));
  }

  return OPT_SUCCESS;
}


//Added by Pritom


/**
 * @brief  Handle encode and decode request, the command response will contain
 *         encoded and decoded data and profiling results.
 * @param  Message received.
 * @retval OPT_SUCCESS in case of success OPT_ERROR otherwise.
 */
OPT_StatusTypeDef EncDec_File_Request(TMsg *Msg)
{
  uint32_t numEncByte = 0;
  uint32_t enc_clock_count = 0;
  uint32_t numDecShort = 0;
  uint32_t dec_clock_count = 0;
  uint8_t toc_byte = 0;
  uint8_t mode = 0;

  /******** Encoder profiling ********/

  /* Enable trace and debug block */
 // CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;

  __disable_irq();

  /* reset the counter */
  DWT->CYCCNT = 0;

  /* enable the counter */
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

  //Commented by Pritom
 // numEncByte = ENC_Opus_Encode(&Msg->Data[3], EncConfigOpus.pInternalMemory);

  /* disable the counter */
  DWT->CTRL &= ~DWT_CTRL_CYCCNTENA_Msk;

//  enc_clock_count = DWT->CYCCNT;

  __enable_irq();

  /***********************************/

  /* "RFC6716 - Definition of the Opus Audio Codec" for more details */

  toc_byte = EncConfigOpus.pInternalMemory[0] >> 3;

  if(toc_byte<12)
  {
    mode = SILK_MODE;
  }
  else if(11<toc_byte && toc_byte<16)
  {
    mode = HYBRID_MODE;
  }
  else if(toc_byte>15)
  {
    mode = CELT_MODE;
  }

  Msg->Data[3] = mode;

  /*if(numEncByte>0)
  {
    STCmdP_Serialize(&Msg->Data[4], numEncByte, 2);
    STCmdP_Serialize(&Msg->Data[6], enc_clock_count, 4);
    //commented out by Pritom
  //  memcpy(&Msg->Data[10], EncConfigOpus.pInternalMemory, numEncByte);
  }
  else
  {
    return OPT_ERROR;
  }
  */
  /******** Decoder profiling ********/

  /* Enable trace and debug block */
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;

  __disable_irq();

  /* reset the counter */
  DWT->CYCCNT = 0;

  /* enable the counter */
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

  numDecShort = DEC_Opus_Decode(EncConfigOpus.pInternalMemory, numEncByte, DecConfigOpus.pInternalMemory);

  /* disable the counter */
  DWT->CTRL &= ~DWT_CTRL_CYCCNTENA_Msk;

  dec_clock_count = DWT->CYCCNT;

  __enable_irq();

  /***********************************/

 /* if(numDecShort>0)
  {
    numDecShort = numDecShort * DecConfigOpus.channels;
    STCmdP_Serialize(&Msg->Data[10+numEncByte], numDecShort, 2);
    STCmdP_Serialize(&Msg->Data[10+numEncByte+2], dec_clock_count, 4);
    memcpy(&Msg->Data[10+numEncByte+2+4], DecConfigOpus.pInternalMemory, numDecShort*2);
  }
  else
  {
    return OPT_ERROR;
  }*/

 // Msg->Len = 10 + numEncByte + 2 + 4 + numDecShort*2;

  return OPT_SUCCESS;
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
