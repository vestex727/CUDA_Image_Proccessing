{ pkgs ? (import <nixpkgs> {
	#config.rocmSupport = true; 
    config.allowUnfree = true;
    config.segger-jlink.acceptLicense = true; 
}), customPkgs ? (import /home/brett/my-nixpkgs {
	config.allowUnfree = true;
    config.segger-jlink.acceptLicense = true;
}), ... }:
pkgs.mkShell
{
	buildInputs = with pkgs; [
		jetbrains.pycharm-professional
	];

	propagatedBuildInputs = with pkgs; [
		
	];

	packages = [
	    (pkgs.python3.withPackages (pip: [
	    	pip.pandas
	    	pip.requests
			pip.numpy
			(pip.opencv4.override { enableGtk2 = true; })
			pip.torch
	    ]))
  	];
	LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";
}
