#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""

echo "Test 1"
    ./s21_grep -e option test.txt > s21_grep_res
    grep -e option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi
echo "Test 2"
    ./s21_grep -v option test.txt > s21_grep_res
    grep -v option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 3"
    ./s21_grep -i option test.txt > s21_grep_res
    grep -i option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 4"
    ./s21_grep -c option test.txt > s21_grep_res
    grep -c option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 5"
    ./s21_grep -l option test.txt > s21_grep_res
    grep -l option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 6"
    ./s21_grep -n option test.txt > s21_grep_res
    grep -n option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 7"
    ./s21_grep -vi option test.txt > s21_grep_res
    grep -vi option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 8"
    ./s21_grep -vc option test.txt > s21_grep_res
    grep -vc option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 9"
    ./s21_grep -vl option test.txt > s21_grep_res
    grep -vl option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 10"
    ./s21_grep -vn option test.txt > s21_grep_res
    grep -vn option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 11"
    ./s21_grep -ic option test.txt > s21_grep_res
    grep -ic option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 12"
    ./s21_grep -il option test.txt > s21_grep_res
    grep -il option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 13"
    ./s21_grep -in option test.txt > s21_grep_res
    grep -in option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 14"
    ./s21_grep -cl option test.txt > s21_grep_res
    grep -cl option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 15"
    ./s21_grep -cn option test.txt > s21_grep_res
    grep -cn option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi

echo "Test 16"
    ./s21_grep -ln option test.txt > s21_grep_res
    grep -ln option test.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              (( COUNTER_FAIL++ ))
        fi


rm -rf grep_res s21_grep_res

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"
