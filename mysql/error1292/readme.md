mysql ERROR 1292 (22007): Incorrect datetime value: '0000-00-00 00:00:00' for column 'create_time' at row 1

⁣这个问题主要由sql_mode的问题 和MySQL版本关系不大，实操是主要是NO_ZERO_DATE控制的（此处没查手册，但在5.6 5.6 8上进行了实操）