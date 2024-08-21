set history save on
set history size 10000
set history filename ~/.gdb_history
set follow-fork-mode child
set print pretty on

define xxd
  print $arg0
  dump binary memory /tmp/dump.bin $arg0 ((char *)$arg0)+$arg1
  shell hexyl /tmp/dump.bin
end
document xxd
  Runs xxd on a memory ADDR and LENGTH

  xxd ADDR LENTH
end

define ps
  print *$arg0
  dump binary memory /tmp/dump.bin $arg0 ((char *)$arg0)+sizeof(*$arg0)
  shell hexyl /tmp/dump.bin
end
document ps
  Print struct from pointer

  psm pointer
end

