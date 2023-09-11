LINK_LIBRARIES := kernel32.lib

747.exe: 747.asm
	ml64 $< /Zi /link /subsystem:windows $(LINK_LIBRARIES) /entry:main

run: 747.exe
	python -c "import subprocess; print(subprocess.call(['747.exe']))"

clean:
	rm -f 747.exe

.PHONY: run clean