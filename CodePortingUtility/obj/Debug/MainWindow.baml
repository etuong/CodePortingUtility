   M S B A M L   `   `   `  ����M  ICodePortingUtility, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:CodePortingUtilityCodePortingUtility  5   	   #    CodePortingUtility.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:CodePortingUtility     5   	     � 
ResizeMode$  NoResize=�5       � Title$ Code Porting Utility��5   	   $	��710��6&   $	��690��63    � 	Resources 5
       �� 
TargetType   CustomButtonStyle ��Name �� Triggers P� Property P� Value �� 
TargetName	 �� Property
 �� Value �� 
TargetType��%<  &	        '�� �    �� 5   
   " ��6   .R�5      �� $ Border��6   $��1q�6%   
�������._�5      �� $��Center=�6#   5       5      P� 5       �@J�IsMouseOver . . �5      �� $ Border��6   	 � ��
 �#e8e8e86G   5      P� 5       � {� .  . �5      �� $ Border��6   	 � ��

 �����6G   �� 5      	 � ��

 �����63   5      5      �� 5   
   " ��6   .�5      �� 	 � ��$
 Italic$�6*   �� 5      	 � ��$
 SemiBold"�6+   �� 5      	 � ��$	
 0 5q�6(   5      5      .��5       ��  �� Padding$
 10 0q�6   ._�5!   
   �� .+�5"      �� $��14(�6   $��Calibri)�6&   $
��Bold"�6;   $
��Wrap=�6M   $��0 10 0 0q�6a   $o��iThe purpose of this utility is to port legacy code by means of replacing strings defined in a dictionary.��5#      �� 5%      $���zInstruction: Select one of the following radio buttons, browse for JSON file and Beyond Compare (optional) and run utility��6   	� 5'      -   5         	�Name$ fileRadioBtn��5'      $
��5 -5q�60   $��10q�6?   ��5(      �� 5)      $��Replace strings in a file��6   $	��600��6B   $	��5 0q�6N   .��5*      �� .+�5+      �� $N��HChoose a directory where the text file (.cpp, .cs, .txt, etc) are stored��6$   � 5,      .+�5-   "   �� -   5         ��Name$ pathTextBox��5-   Q   $	��470��6*   $
��Left=�66   $0��*Enter the file directory or browse for one��6f   �� 5.   "   -   5         ��Name$ 	browseBtn��5.   B   $��30��6)   $	��...��64   #��[  6m   5/      50      51      53      	� 55      -   5        $ boxRadioBtn��55      $
��5 -5q�6/   $��10q�6>   ��56      �� 57      $��Replace strings in a box��6   $	��600��6A   $	��360��6M   $	��5 0q�6Z   .��58      �� .+�59      �� $��Paste in texts��6$   �� 5:      -   5        $ txtBox��5;   \   $	��575��5:   &   $	��305��62    �� TextWrapping$
 Wrap=�6?    �� AcceptsReturn . $
��Left=�6h   $��Disabled=�5;   &   $
��Auto=�5<   &   5=      5>      5@      �� 5B      $
��10 5q�6   .+�5C      �� $0��*Browse JSON file to be parse to dictionary��6   � 5D      .+�5E      �� -   5        $ jsonTextBox��5E   E   $	��470��6   $
��Left=�6*   $B��<C:\Utilities\CodePortingScripts\MappingsForMultiReplace.json��6Z   �� 5F      -   5        $ jsonBtn��5F   6   $��30��6   $	��...��6(   #��[  6]   5G      5H      �� 5J      $
��10 5q�6   .+�5K      �� $b��\(Optional feature) Beyond Compare (BComp.exe) program, this compares the string replacements��6   � 5L      .+�5M      �� -   5        $ bCompTextBox��5M   E   $	��470��6   $
��Left=�6*   $1��+C:\Program Files\Beyond Compare 4\BComp.exe��6[   �� 5N      -	   5        $ bCompBtn��5N   6   $��30��6   $	��...��6(   #��[  6_   5O      5P      �� 5R      $
��10 5q�6   .+�5S      �� $!��Click button to run utility��6   �� 5T      -
   5        $ runBtn��5T   T   $��80��6   $��20��6$   $��13(�60   $��Run Utility��6>   $
��Left=�5U      #��[  60   5V      5X      5Y      5[      