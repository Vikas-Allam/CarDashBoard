cmake_minimum_required(VERSION 3.14)

project(DataSender)
find_package(Qt6 REQUIRED COMPONENTS Sql)

find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)
add_library(DataSender SHARED vehicledatasender.cpp vehicledatasender.h)
target_link_libraries(DataSender PRIVATE Qt6::Gui Qt6::Quick)
include_directories("${CMAKE_SOURCE_DIR}/SqlDataBase/")
target_link_directories(DataSender PUBLIC sqlDataBase/)
target_link_libraries(DataSender PRIVATE Qt6::Sql)

target_link_libraries(DataSender PUBLIC  SqlDataBase)
