cmake_minimum_required(VERSION 3.14)

project(SqlDataBase)
add_library(SqlDataBase SHARED database.cpp database.h)
find_package(Qt6 REQUIRED COMPONENTS Sql)
find_package(Qt6 6.4 COMPONENTS Quick Gui REQUIRED)
target_link_libraries(SqlDataBase PRIVATE Qt6::Gui Qt6::Quick)
target_link_libraries(SqlDataBase PRIVATE Qt6::Sql)
