Public Function gsyBankerRound(dblIn As Double, lngN As Long) As Double
'''This function performs Banker's Rounding.
'''
'''Parameters
'''----------
'''dblIn:  double
'''    The number that needs to be rounded.
'''
'''lngN: long
'''    The decimal place to keep.
'''
'''Returns
'''---------
'''Double : Double
'''    The rounded number via Banker's Rounding.

    Dim boolIsEven As Boolean

    ' not greater than half
    Dim boolNGThanHalf As Boolean

    Dim lngExp As Long

    Dim lngTemp As Long

    lngExp = 10 ^ lngN

    lngTemp = 1 * Fix(dblIn * lngExp / 1)

    If (lngTemp Mod 2) = 0 Then

        boolIsEven = True

'        Debug.Print CStr(lngTemp) & " Is Even"

    Else

        boolIsEven = False

        Debug.Print CStr(lngTemp) & " Is Not Even"

    End If

    ' this is equivalent to the MOD formula in the GUI (different from VBA)
    If Application.WorksheetFunction.Round((dblIn * lngExp - (1 * Fix(dblIn * lngExp / 1))), 2) <= 0.5 Then

        boolNGThanHalf = True

    Else

        boolNGThanHalf = False

    End If

    If (boolIsEven = True) And (boolNGThanHalf = True) Then

        gsyBankerRound = Application.WorksheetFunction.RoundDown(dblIn, lngN)

    Else

        ' common round half up
        gsyBankerRound = Application.WorksheetFunction.Round(dblIn, lngN)

    End If

End Function
