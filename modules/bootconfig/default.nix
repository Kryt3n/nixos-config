{ config, ... }:
{
  imports = [];
  boot = {

    ### uncomment to boot silently
    #initrd.verbose = false; 
    #consoleLogLevel = 0;
    #kernelParams = [ "quiet" "udev.log_level=3" ];

#    kernelPatches = { 
#      name = "foo"; 
#      patch = ./foo.patch; #can be null if only config changes are applied
#      extraStructuredConfig = {
#        FOO = lib.kernel.yes; #look this up idk. optional apparently
#      };
#      features = {
#        foo = true;
#      };
#      extraConfig = "FOO y";
#    };    


    loader = {
      timeout = 5;
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        gfxmodeEfi = "auto";
        configurationLimit = 12;
        #entryOptions = "";
        #extraConfig = "";
        #extraEntries = "";
        #extraEntriesBeforeNixOS = false;
        #extraPerEntryConfig = "";
        #extraPrepareConfig = "";
        #subEntryOptions = "";
        #theme = "";
        #timeoutStyle = "";      
      };
    };
  };


}
