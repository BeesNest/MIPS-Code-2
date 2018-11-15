.data

    input_too_long:
    .asciiz "Input is too long."
    input_is_empty:
   .asciiz "Input is empty."
    invalid_number:
    .asciiz "Invalid base-36 number."
    input_storage:
    .space 2000
    filtered_input:                             # allocate 4 bytes for filtered out string that doesn't have white spaces
    .space 4

.text
main:
