IF(${CPU} MATCHES "MIMXRT1052.*")
    set(SDK "MIMXRT1052")
ELSEIF(${CPU} MATCHES "MIMXRT1062.*")
    MESSAGE(${CPU})
    set(SDK "MIMXRT1062")
ELSE()
    MESSAGE(FATAL_ERROR "Unsupported CPU!")
ENDIF()
MESSAGE(${SDK})
add_lib_files(${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/drivers/*.c)
set(fsl_bsp_drivers_files ${LIB_FILES})
set(LIB_FILES "" CACHE STRING "Lib Files" FORCE)


add_lib_files(${CMAKE_CURRENT_SOURCE_DIR}/variants/${BOARD}/xip/*.c)
set(fsl_xip_drivers_files ${LIB_FILES})
set(LIB_FILES "" CACHE STRING "Lib Files" FORCE)
add_library(fsl_xip_drivers STATIC  ${fsl_xip_drivers_files})
target_include_directories(fsl_xip_drivers PUBLIC
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/CMSIS/Include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/drivers
                    ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino
                    )


add_lib_files(${CMAKE_CURRENT_SOURCE_DIR}/cores/USB/*.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/*.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/debug_console/*.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/str/*.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/serial_manager/serial_manager.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/serial_manager/serial_port_uart.c
              ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/uart/*.c
)
set(fsl_usb_drivers_files ${LIB_FILES})
set(LIB_FILES "" CACHE STRING "Lib Files" FORCE)
add_library(fsl_usb_drivers STATIC  ${fsl_usb_drivers_files})
target_include_directories(fsl_usb_drivers PUBLIC
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/CMSIS/Include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/drivers
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/osa
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/device
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/phy
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/host
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/debug_console
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/str
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/serial_manager
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/uart
                    ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino/USB
                    ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino
                    )

add_library(fsl_bsp STATIC  ${fsl_bsp_drivers_files}
                            ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/system_${SDK}.c
                            )
target_include_directories(fsl_bsp PUBLIC
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/CMSIS/Include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/drivers
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/xip
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/str
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/debug_console
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/uart
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/serial_manager
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/lists
                                        )
                    

                                            
add_lib_files(${CMAKE_CURRENT_SOURCE_DIR}/cores/*.c)
add_lib_files(${CMAKE_CURRENT_SOURCE_DIR}/cores/*.cpp)
set(arduinocore_files ${LIB_FILES})
set(LIB_FILES "" CACHE STRING "Lib Files" FORCE)
add_library(arduinocore STATIC  ${arduinocore_files})
target_include_directories(arduinocore PUBLIC
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/CMSIS/Include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/drivers
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/include
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/osa
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/device
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/phy
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/middleware/usb/host
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/devices/${SDK}/utilities/debug_console
                    ${CMAKE_CURRENT_SOURCE_DIR}/tools/sdk/components/serial_manager
                    ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino/USB
                    ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino
                    )
