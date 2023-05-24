<div align="center">
  <p></p>
  <p><b><i> ~Bspwm dotfiles ~ </i></b></p>
  <img src="https://img.shields.io/github/last-commit/S4NKALP/dotfile?color=%23c4a7e7&style=for-the-badge">
  <img src="https://img.shields.io/github/repo-size/S4NKALP/dotfile?color=%23e0def4&style=for-the-badge">
  <img src="https://img.shields.io/github/stars/S4NKALP/dotfile?color=%23ebbcba&style=for-the-badge">
  <img src="https://img.shields.io/github/license/S4NKALP/dotfile?color=%239ccfd8&style=for-the-badge">
</div>


## Info

|Distro|[Arch](https://archlinux.org/)|
|:---:|:---:|
|WM|[BSPWM](https://github.com/baskerville/bspwm)|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Menu|[Rofi](https://github.com/davatorium/rofi)|
|Compositor|[Ibhagwan-Picom](https://github.com/ibhagwan/picom-ibhagwan-git)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)-[Kitty](https://sw.kovidgoyal.net/kitty/)|
|Widgets|[ElKowars wacky widgets ](https://github.com/elkowar/eww)|
|Music/Player|[mpd](https://archlinux.org/packages/extra/x86_64/mpd/)-[ncmpcpp](https://archlinux.org/packages/community/x86_64/ncmpcpp/)|
|File Manager|[Thunar](https://archlinux.org/packages/extra/x86_64/thunar/)|


<table align="center">
   <tr>
      <th align="center">
         <sup><sub>:warning: WARNING :warning:</sub></sup>
      </th>
   </tr>
   <tr>
      <td align="center">
      
      
      
     THIS DOTFILES ARE CONFIGURED AT 1920x1080 WITH 96 DPI! 1 MONITOR
     SOME STUFF MIGHT BREAK ON LOWER OR HIGHER
     RESOLUTIONS BUT WILL STILL WORK!
     
   </tr>
   </table>

## Very useful keybindigs to know...

- <code>alt + F1</code> For HotKeys
- <code>alt + @space</code> Apps Menu.
- <code>super + h </code> Hides bar
- <code>Print</code> Takes screenshot.
- <code>super + Return</code> Open a terminal.
- <code>super + shift + Return</code> Open a floating terminal.
- <code>super + c</code>  Kill a window/process.
- <code>shift + alt + w</code> Changes randomly wallpaper.
- <code>ctrl + shift + r</code> Restart bspwm.
[Other Keybinds](https://github.com/S4NKALP/bspwm/wiki/Keyboard-Shortcuts.md)


 ## 📦 Setup (Isn't Full Installation. Be careful about it.)
 > This is step-by-step how to install these bspwm dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

### 💾 Installation:
The installer only works for **ARCH** Linux, and based distros.

<b>Open a terminal in HOME</b>
- **Clone the repo**
```sh 
git clone https://github.com/S4NKALP/bspwm.git 
cd bspwm

```
- **Install needed dependencies**
```sh
./install (if it show error give permission by chmod +x install

```
- **After installing copy all files to respective location**
- **If config didn't work then just give executive permission to all**
- **Copy fonts file to ~/.local/share/**

   <br>

> Once finished copying the files, you might want to finalize the changes to your system.

```sh
 # Rebuilds the font cache
 $ fc-cache -fv
```

## Miscellaneous.

- **Elkowar's Wacky Widgets**

  > If you're **NOT** using a monitor with a 1280x1080 resolution, you might want to change the `x` and `y` values of the widgets on the config.

- **Theme <kbd>Suggested</kbd>**

  > Nordic Master [here](https://github.com/EliverLara/Nordic) & [another](https://github.com/Adapta-Projects/Papirus-Nord)
  
- **Icon Theme <kbd>Suggested</kbd>**
  > Nordzy Icon  [this](https://github.com/alvatip/Nordzy-icon.git)

- **Make Yourself window rule in bspwm** 
  
   <br>

> Lastly, log out from your current desktop session and log in into bspwm.

   <br>

## Some tips
* If u dont want to use the random wallpapers comment line 150 from /home/YourUser/.config/bspwm/bspwmrc file.


## Troubleshooting
* **Weather module is showing wrong values**

You need to edit ~/.config/eww/scripts/weather_info & in slidebar/scripts/Weather  change the name of your city, you can get it from [openweathermap](https://openweathermap.org/)

## Acknowledgements.

- **Thanks to**

  - [rxyhn](https://github.com/rxyhn) 
  - [gh0szkt](https://github.com/gh0stzk) 
  -  I forgot from where I took other code
   <br>


<details>
<summary><b>Screenshots</b></summary>

**`Desktop`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/desktop.png" width="600"/>

**`Polybar`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/bar.png" width="800"/>

**`Old Polybar`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/old_bar.png" width="800"/>

**`Info-Panel`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/info-panel.png" width="600"/>

**`Side-Bar`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/sidebar.png" width="600"/>

**`MusicPlayer`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/musicplayer.png" width="600"/>


**`FireFox`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/firefox.png" width="600"/>


**`Old`**

<img src="https://raw.githubusercontent.com/S4NKALP/dotfile/main/assets/old.wpeg" width="600"/>
 </details>


