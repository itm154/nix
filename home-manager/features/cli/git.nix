{ pkgs, ... }: {
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
        credential = {
          credentialStore = "secretservice";
          helper = "${pkgs.nur.repos.utybo.git-credential-manager}/bin/git-credential-manager";
        };
      };
    };
  };
}
