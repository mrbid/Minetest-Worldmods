# warning this could break some textures adding black pixels in the corners or just breaking any transparency they might have had
for file in /home/v/Desktop/worldmods/*.png /home/v/Desktop/worldmods/**/textures/*.png /home/v/Desktop/worldmods/**/*.png ; do
  trimage -f "$file"
done;