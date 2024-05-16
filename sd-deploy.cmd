@echo off
echo Detecting Python Version:
python --version > temp.txt
find "3.10." temp.txt
if errorlevel 1 (
	echo Python Version NOT MATCH Requirement, Need 3.10 Version.
	echo Copy under Command to Install Python 3.10:
	echo Using Winget:
	echo winget install python.python.3.10
	echo Using Conda:
	echo conda create -n sd python=3.10
	del temp.txt
	pause
	exit
)
echo Python Version MATCH Requirement
del temp.txt
pause
echo Please Choose Stable Diffusion WebUI: 
echo 1. ComfyUI (Recommand)
echo 2. ComfyUI for DirectML
echo 3. Stable Diffusion WebUI
echo 4. Stable Diffusion WebUI (DirectML)
set /p choose=You Choose: 
if %choose%==1 (
	git clone https://github.com/comfyanonymous/ComfyUI.git
	cd ComfyUI
	pip install torch torchvision torchaudio
	pip install -r requirements.txt
) else if %choose%==2 (
	git clone https://github.com/comfyanonymous/ComfyUI.git
	cd ComfyUI
	pip install torch-directml torchvision torchaudio
	pip install -r requirements.txt
) else if %choose%==3 (
	git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
	cd  stable-diffusion-webui
	pip install torch torchvision torchaudio
	pip install -r requirements.txt
) else if %choose%==4 (
	git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml.git
	cd  stable-diffusion-webui-directml
	pip install torch-directml torchvision torchaudio
	pip install -r requirements.txt
) else (
	echo Please Choose Once!
	pause
)