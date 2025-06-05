#ifndef SCREEN_RECORDING_H
#define SCREEN_RECORDING_H

#include <stdbool.h>

bool checkScreenRecordingPermission(void);
void requestScreenRecordingPermission(void);

#endif