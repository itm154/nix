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
    };

    gh = {
      enable = true
      gitCredentialHelper.enable = true;

      extensions = with pkgs; [
        gh-markdown-preview
      ];
    }
  };
}
