#ifndef MICROPHONE_H
#define MICROPHONE_H

#include <stdbool.h>

bool checkMicrophonePermission(void);
bool requestMicrophonePermission(void);

#endif