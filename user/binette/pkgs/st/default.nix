{ stdenv, lib, fetchgit, pkgconfig, writeText, libX11, ncurses, libXft, harfbuzzFull,
conf ? null }:

with lib;

stdenv.mkDerivation rec {
  name = "st-head";

  src = fetchgit {
    url = "https://github.com/LukeSmithXYZ/st";
    rev = "13b3c631be13849cd80bef76ada7ead93ad48dc6";
    sha256 = "009za6dv8cr2brs31sjqixnkk3jwm8k62qk38sz4ggby3ps9dzf4";
  };

  nativeBuildInputs = [ pkgconfig ncurses ];
  buildInputs = [ libX11 libXft harfbuzzFull ];

  installPhase = ''
    sed -i '/man/d' Makefile
    sed -i '/tic/d' Makefile
    TERMINFO=$out/share/terminfo make PREFIX=$out install
  '';

  meta = {
    homepage = "https://github.com/LukeSmithXYZ/st";
    description = "Luke's fork of the suckless simple terminal (st)";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
