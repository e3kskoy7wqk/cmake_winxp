IFDEF RAX
ELSE
.MODEL FLAT,C
ENDIF

SOME SEGMENT EXECUTE READ

public justnop
justnop:
  ret

END
