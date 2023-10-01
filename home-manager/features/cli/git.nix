{
  pkgs,
  config,
  ...
}: {
  programs = {
    git = {
      enable = true;

      userName = "itm154";
      userEmail = "ashrulfahmi@gmail.com";
      
      diff-so-fancy = {
        enable = true;
        stripLeadingSymbols = false;
      };

      extraConfig = {
        credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
      };
    };
  };
}
