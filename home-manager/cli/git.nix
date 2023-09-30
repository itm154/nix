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
  };
}
