#
# Copyright(c) 2019 Intel Corporation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

add_application_library(usm_hello_world
    SOURCE
    "include/usm_hello_world/usm_hello_world.hpp"
    "src/usm_hello_world.cpp"
)
target_link_libraries(usm_hello_world_lib
    PUBLIC
    compute_samples::timer
    compute_samples::logging
    Boost::program_options
    compute_samples::ocl_utils
    compute_samples::boost_intel
)
add_kernels(usm_hello_world_lib "usm_hello_world.cl")

add_application(usm_hello_world
    SOURCE
    "src/main.cpp"
)
install_kernels(usm_hello_world "usm_hello_world.cl")

add_application_test(usm_hello_world
    SOURCE
    "test/main.cpp"
    "test/usm_hello_world_integration_tests.cpp"
    "test/usm_hello_world_system_tests.cpp"
)
install_kernels(usm_hello_world_tests "usm_hello_world.cl")