#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

GPU_TARGET_PLATFORM := default_7a
GPU_TYPE:=t82x
GPU_ARCH:=midgard
GPU_DRV_VERSION:=r16p0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
# midgard r7p0 is 3.1, r11p0 is 3.2
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version=196608
