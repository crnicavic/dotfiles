# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:


{
	imports = [ 
		# Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
		
	boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/e8cf8f5d-0cfc-45fd-b9bd-265b662bff01";

	# networking.hostName = "nixos"; # Define your hostname.
	# Pick only one of the below networking options.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	virtualisation.vmware.host.enable = true;
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"vmware-workstation"
	];
	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

	# Set your time zone.
	time.timeZone = "Europe/Belgrade";

	# Enable the X11 windowing system.
	services.xserver.enable = true;
	services.xserver.displayManager.session = [
	{ 
		manage = "desktop";
		name = "dwm";
		# i honestly dont know why this works
		start = ''startdwm'';
	}
	];



	# Configure keymap in X11
	services.xserver.xkb.layout = "us";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	# Enable sound.
	# hardware.pulseaudio.enable = true;
	# OR
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	# Enable touchpad support (enabled default in most desktopManager).
	services.libinput.enable = true;

	 # Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.user = {
	isNormalUser = true;
	extraGroups = [ "wheel" "audio" "video"]; # Enable ‘sudo’ for the user.
	packages = with pkgs; [
			firefox
			tree
			arandr
			autorandr
			vmware-workstation
			cmus
			mpv
		];
	};
	programs.light.enable = true;
	fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
	programs.slock.enable = true;
	security.polkit.enable = true;
	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		wget
		git 
		vim
		htop
		tmux
		ntfs3g
		(import /home/user/dotfiles/nixos/dwm.nix)
		neofetch
		polkit_gnome
		xorg.xbacklight
		xss-lock
		acpi
	];
	systemd = {
		user.services.polkit-gnome-authentication-agent-1 = {
			description = "polkit-gnome-authentication-agent-1";
			wantedBy = [ "graphical-session.target" ];
			wants = [ "graphical-session.target" ];
			after = [ "graphical-session.target" ];
			serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
			};
		};

	};
	system.stateVersion = "24.05"; 

}

