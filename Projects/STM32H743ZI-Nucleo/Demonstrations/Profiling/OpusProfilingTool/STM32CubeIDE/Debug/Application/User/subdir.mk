################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/main.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/opt_cmd_handlers.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/opus_interface.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/stcmdp_manager.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/stm32xx_it.c \
../Application/User/syscalls.c \
../Application/User/sysmem.c \
D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/uart_protocol_interface.c 

OBJS += \
./Application/User/main.o \
./Application/User/opt_cmd_handlers.o \
./Application/User/opus_interface.o \
./Application/User/stcmdp_manager.o \
./Application/User/stm32xx_it.o \
./Application/User/syscalls.o \
./Application/User/sysmem.o \
./Application/User/uart_protocol_interface.o 

C_DEPS += \
./Application/User/main.d \
./Application/User/opt_cmd_handlers.d \
./Application/User/opus_interface.d \
./Application/User/stcmdp_manager.d \
./Application/User/stm32xx_it.d \
./Application/User/syscalls.d \
./Application/User/sysmem.d \
./Application/User/uart_protocol_interface.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/main.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/main.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/main.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/opt_cmd_handlers.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/opt_cmd_handlers.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/opt_cmd_handlers.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/opus_interface.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/opus_interface.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/opus_interface.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stcmdp_manager.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/stcmdp_manager.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stcmdp_manager.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32xx_it.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/stm32xx_it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32xx_it.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/syscalls.o: ../Application/User/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/syscalls.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/sysmem.o: ../Application/User/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/sysmem.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/uart_protocol_interface.o: D:/opus\ all/STM32CubeExpansion_OPUS_V1.0.0/Projects/STM32H743ZI-Nucleo/Demonstrations/Profiling/OpusProfilingTool/Src/uart_protocol_interface.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu90 -g3 -DUSE_HAL_DRIVER -DARM_MATH_CM4 -DHAVE_CONFIG_H -DSTM32H743xx -DDEBUG -DOPUS_ARM_ASM -DOPUS_ARM_INLINE_ASM -c -I../../Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../../../../../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/STM32H7xx_Nucleo -I../../../../../../../Middlewares/ST/STCmdP/inc -I../../../../../../../Middlewares/Third_Party/Opus/celt -I../../../../../../../Middlewares/Third_Party/Opus/celt/arm -I../../../../../../../Middlewares/Third_Party/Opus/include -I../../../../../../../Middlewares/Third_Party/Opus/silk -I../../../../../../../Middlewares/Third_Party/Opus/silk/arm -I../../../../../../../Middlewares/Third_Party/Opus/silk/fixed -I../../../../../../../Middlewares/Third_Party/Opus/src -I../../../../../../../Middlewares/Third_Party/Opus -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/uart_protocol_interface.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

