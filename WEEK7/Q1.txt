$regfile = "8052.dat" 			' Used 8052 register
$crystal = 11059200 			' System Clock 11.0592MHz
$baud = 9600 				' Serial Buad-rate 9600 bps
$romstart = &H8000 			' Start at 8000H
Dim Data_show As Byte
Dim Data_index As Byte
Waitms 250 				' Start Dealy 250ms
Printbin &HC				 ' Clear Screen

Data_show = Lookup(&HB , Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(5, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(9, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(0, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(8, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(4, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(3, Segment_table)
Out &HE060 , Data_show
Waitms 250

Data_show = Lookup(1, Segment_table)
Out &HE060 , Data_show
Waitms 250



'========================================================
Segment_table: ' Tedc Bafg
 Data &B00111111 , &B00000110 , &B01011011 , &B01001111 ' Code 0123
 Data &B01100110 , &B01101101 , &B01111101 , &B00000111 ' Code 4567
 Data &B01111111 , &B01101111 , &B01110111 , &B01111100 ' Code 89ab
 Data &B00111001 , &B01011110 , &B01111001 , &B01110001 ' Code cdef
End