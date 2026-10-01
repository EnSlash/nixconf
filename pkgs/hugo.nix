{ fetchFromGitHub, hugo }:

hugo.overrideAttrs (_old: {
  version = "0.126.1";

  src = fetchFromGitHub {
    owner = "gohugoio";
    repo = "hugo";
    rev = "v0.126.1";
    hash = "sha256-c421kzgD6PFM/9Rn+NmZGyRlJPWhQPraW/4HcuRoEUU=";
  };

  vendorHash = "sha256-VfwiA5LCAJ1pkmMCy/Dcc5bLKkNY1MHtxHcHvKLoWHs=";
})
