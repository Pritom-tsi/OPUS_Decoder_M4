################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Middlewares/Third_Party/Opus/celt/arm/arm_celt_map.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Middlewares/Third_Party/Opus/celt/arm/armcpu.c 

OBJS += \
./Middlewares/Third\ Party/Opus/celt/arm/arm_celt_map.o \
./Middlewares/Third\ Party/Opus/celt/arm/armcpu.o 

C_DEPS += \
./Middlewares/Third\ Party/Opus/celt/arm/arm_celt_map.d \
./Middlewares/Third\ Party/Opus/celt/arm/armcpu.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third\ Party/Opus/celt/arm/arm_celt_map.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Middlewares/Third_Party/Opus/celt/arm/arm_celt_map.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32L552xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/Third Party/Opus/celt/arm/arm_celt_map.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/Third\ Party/Opus/celt/arm/armcpu.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Middlewares/Third_Party/Opus/celt/arm/armcpu.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32L552xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/Third Party/Opus/celt/arm/armcpu.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

