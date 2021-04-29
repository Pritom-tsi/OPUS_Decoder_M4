################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.c 

OBJS += \
./Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.o 

C_DEPS += \
./Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

