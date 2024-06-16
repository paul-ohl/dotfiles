(defcfg
  ;; For Linux
  input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
  output (uinput-sink "My KMonad output"
    "/usr/bin/sleep 1 && setxkbmap -option compose:menu")
  cmp-seq menu    ;; Set the compose key to 'Menu'
  cmp-seq-delay 5 ;; 5ms delay between each compose-key sequence press

  ;; For Windows
  ;; input  (low-level-hook)
  ;; output (send-event-sink)

  ;; For MacOS
  ;; input  (iokit-name "my-keyboard-product-string")
  ;; output (kext)

  ;; Comment this if you want unhandled events not to be emitted
  fallthrough true

  ;; Set this to false to disable any command-execution in KMonad
  allow-cmd false
)

;; Source definition
(defsrc
  grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab   q    w    e    r    t    y    u    i    o    p    [    ]    ret
  caps  a    s    d    f    g    h    j    k    l    ;    '    \
  lsft lsgt  z    x    c    v    b    n    m    ,    .    /    rsft
  lctl comp  lmet lalt            spc           ralt rmet rctl
)

;; mod remaps
(defalias
  sspace (tap-hold-next-release 200 spc (around lctrl (around lalt lmet)))
  ces esc
)

;; Accents
(defalias
  aalt (layer-toggle accents)
  acap (tap-hold-next-release 200 caps (layer-toggle accents))
  ac #(compose ')
  gr #(compose `)
  cir #(compose ^)
  cc #(compose , c)
)

;; home-row mods
(defalias
    meta (tap-hold-next-release 250 a lmet)
    altr (tap-hold-next-release 250 r lalt)
    ctls (tap-hold-next-release 250 s lctl)
    sftt (tap-hold-next-release 250 t lsft)

    sftn (tap-hold-next-release 250 n rsft)
    ctle (tap-hold-next-release 250 e rctl)
    alti (tap-hold-next-release 250 i lalt)
    meto (tap-hold-next-release 250 o rmet)

    sd (tap-hold-next-release 250 down  rsft)
    cu (tap-hold-next-release 250 up    rctl)
    ar (tap-hold-next-release 250 right ralt)
)

(deflayer main
  grv   1     2     3     4     5    6    7     8     9     0     -    =    bspc
  tab   q     w     f     p     b    j    l     u     y     ;     [    ]    ret
  @ces  @meta @altr @ctls @sftt g    m    @sftn @ctle @alti @meto '    \
  lsft  grv   z     x     c     d    v    k     h     ,     .     /    rsft
  lctl  XX    lmet  @aalt          @sspace            @acap rctl  rctl
)

(deflayer accents
  @gr  XX    XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX
  XX   XX    XX   @ac  XX   XX   XX   XX   @cir XX   XX   XX   XX   XX
  XX   lmet  lalt lctl lsft XX   XX   @sd  @cu  @ar  rmet XX   XX
  XX   @gr   XX   XX   @cc  XX   XX   XX   left XX   XX   XX   XX
  XX   XX    XX   XX             XX             XX   XX   XX
)

;; vim: set ft=lisp
