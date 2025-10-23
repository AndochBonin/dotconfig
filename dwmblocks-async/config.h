#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
	X("", "echo CPU: `top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8 \"%\"}'`", 1, 1) \
	X("", "echo Mem: `free -h | awk '/Mem:/ {print $3\"/\"$2}'`", 60, 2) \
	X("", "echo Wifi: `nmcli networking connectivity`", 30, 3) \
	X("", "wpctl status | grep \\* | head -1 | tr -s ' ' | cut -d' ' -f5", 5, 4) \
	X("", "wpctl get-volume @DEFAULT_SINK@", 1, 4) \
    	X("", "date +'%H:%M:%S %a %d/%m/%y'", 1, 5)
#endif  // CONFIG_H
