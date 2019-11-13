

# Introducir resultados del último sorteo
ultimos_10sorteos=matrix(0,10,8)

# Fecha más antigua: # 02/05/2015

# 06/05/2017
ultimos_10sorteos[1,1]<-27
ultimos_10sorteos[1,2]<-22
ultimos_10sorteos[1,3]<-34
ultimos_10sorteos[1,4]<-26
ultimos_10sorteos[1,5]<-31
ultimos_10sorteos[1,6]<-01
ultimos_10sorteos[1,7]<-28
ultimos_10sorteos[1,8]<-3
# 04/05/2017
ultimos_10sorteos[2,1]<-17
ultimos_10sorteos[2,2]<-11
ultimos_10sorteos[2,3]<-09
ultimos_10sorteos[2,4]<-23
ultimos_10sorteos[2,5]<-28
ultimos_10sorteos[2,6]<-36
ultimos_10sorteos[2,7]<-20
ultimos_10sorteos[2,8]<-0
# 29/04/2015
ultimos_10sorteos[3,1]<-03
ultimos_10sorteos[3,2]<-46
ultimos_10sorteos[3,3]<-24
ultimos_10sorteos[3,4]<-35
ultimos_10sorteos[3,5]<-12
ultimos_10sorteos[3,6]<-22
ultimos_10sorteos[3,7]<-26
ultimos_10sorteos[3,8]<-2
# 27/04/2015
ultimos_10sorteos[4,1]<-26
ultimos_10sorteos[4,2]<-11
ultimos_10sorteos[4,3]<-44
ultimos_10sorteos[4,4]<-33
ultimos_10sorteos[4,5]<-32
ultimos_10sorteos[4,6]<-10
ultimos_10sorteos[4,7]<-28
ultimos_10sorteos[4,8]<-4
# 22/04/2015
ultimos_10sorteos[5,1]<-16
ultimos_10sorteos[5,2]<-01
ultimos_10sorteos[5,3]<-26
ultimos_10sorteos[5,4]<-11
ultimos_10sorteos[5,5]<-47
ultimos_10sorteos[5,6]<-45
ultimos_10sorteos[5,7]<-41
ultimos_10sorteos[5,8]<-4
# 20/04/2015 
ultimos_10sorteos[6,1]<-28
ultimos_10sorteos[6,2]<-21
ultimos_10sorteos[6,3]<-11
ultimos_10sorteos[6,4]<-16
ultimos_10sorteos[6,5]<-46
ultimos_10sorteos[6,6]<-22
ultimos_10sorteos[6,7]<-25
ultimos_10sorteos[6,8]<-6
# 15/04/2015
ultimos_10sorteos[7,1]<-06
ultimos_10sorteos[7,2]<-24
ultimos_10sorteos[7,3]<-35
ultimos_10sorteos[7,4]<-30
ultimos_10sorteos[7,5]<-14
ultimos_10sorteos[7,6]<-48
ultimos_10sorteos[7,7]<-04
ultimos_10sorteos[7,8]<-0
# 13/04/2015
ultimos_10sorteos[8,1]<-20
ultimos_10sorteos[8,2]<-14
ultimos_10sorteos[8,3]<-41
ultimos_10sorteos[8,4]<-24
ultimos_10sorteos[8,5]<-47
ultimos_10sorteos[8,6]<-02
ultimos_10sorteos[8,7]<-36
ultimos_10sorteos[8,8]<-3
# 07/05/2015
ultimos_10sorteos[9,1]<-47
ultimos_10sorteos[9,2]<-14
ultimos_10sorteos[9,3]<-35
ultimos_10sorteos[9,4]<-45
ultimos_10sorteos[9,5]<-11
ultimos_10sorteos[9,6]<-09
ultimos_10sorteos[9,7]<-27
ultimos_10sorteos[9,8]<-3
# 02/05/2015
ultimos_10sorteos[10,1]<-13
ultimos_10sorteos[10,2]<-39
ultimos_10sorteos[10,3]<-07
ultimos_10sorteos[10,4]<-49
ultimos_10sorteos[10,5]<-48
ultimos_10sorteos[10,6]<-36
ultimos_10sorteos[10,7]<-25
ultimos_10sorteos[10,8]<-4

sorteos_anteriores<- readRDS(file="sorteos-anteriores.rds")

sorteos_anteriores<-rbind(sorteos_anteriores,ultimos_10sorteos)

saveRDS(sorteos_anteriores, file="sorteos-anteriores.rds")
#
# 
# # 17/12/2016
# sorteos_anteriores[81,1]<-11
# sorteos_anteriores[81,2]<-18
# sorteos_anteriores[81,3]<-31
# sorteos_anteriores[81,4]<-34
# sorteos_anteriores[81,5]<-35
# sorteos_anteriores[81,6]<-45
# sorteos_anteriores[81,7]<-32
# sorteos_anteriores[81,8]<-4
# # 05/03/2016
# sorteos_anteriores[82,1]<-38
# sorteos_anteriores[82,2]<-45
# sorteos_anteriores[82,3]<-7
# sorteos_anteriores[82,4]<-6
# sorteos_anteriores[82,5]<-11
# sorteos_anteriores[82,6]<-28
# sorteos_anteriores[82,7]<-33
# sorteos_anteriores[82,8]<-6
# # 03/03/2016
# sorteos_anteriores[83,1]<-2
# sorteos_anteriores[83,2]<-43
# sorteos_anteriores[83,3]<-29
# sorteos_anteriores[83,4]<-13
# sorteos_anteriores[83,5]<-14
# sorteos_anteriores[83,6]<-45
# sorteos_anteriores[83,7]<-46
# sorteos_anteriores[83,8]<-1
# # 27/02/2016
# sorteos_anteriores[84,1]<-11
# sorteos_anteriores[84,2]<-5
# sorteos_anteriores[84,3]<-35
# sorteos_anteriores[84,4]<-32
# sorteos_anteriores[84,5]<-20
# sorteos_anteriores[84,6]<-43
# sorteos_anteriores[84,7]<-26
# sorteos_anteriores[84,8]<-6
# # 25/02/2016
# sorteos_anteriores[85,1]<-34
# sorteos_anteriores[85,2]<-26
# sorteos_anteriores[85,3]<-17
# sorteos_anteriores[85,4]<-11
# sorteos_anteriores[85,5]<-13
# sorteos_anteriores[85,6]<-48
# sorteos_anteriores[85,7]<-19
# sorteos_anteriores[85,8]<-3
# # 20/02/2016
# sorteos_anteriores[86,1]<-17
# sorteos_anteriores[86,2]<-11
# sorteos_anteriores[86,3]<-41
# sorteos_anteriores[86,4]<-45
# sorteos_anteriores[86,5]<-3
# sorteos_anteriores[86,6]<-47
# sorteos_anteriores[86,7]<-10
# sorteos_anteriores[86,8]<-6
# # 18/02/2016
# sorteos_anteriores[87,1]<-35
# sorteos_anteriores[87,2]<-47
# sorteos_anteriores[87,3]<-28
# sorteos_anteriores[87,4]<-3
# sorteos_anteriores[87,5]<-10
# sorteos_anteriores[87,6]<-49
# sorteos_anteriores[87,7]<-8
# sorteos_anteriores[87,8]<-1
# # 13/02/2016
# sorteos_anteriores[88,1]<-30
# sorteos_anteriores[88,2]<-43
# sorteos_anteriores[88,3]<-34
# sorteos_anteriores[88,4]<-27
# sorteos_anteriores[88,5]<-46
# sorteos_anteriores[88,6]<-49
# sorteos_anteriores[88,7]<-14
# sorteos_anteriores[88,8]<-1
# # 11/02/2016
# sorteos_anteriores[89,1]<-12
# sorteos_anteriores[89,2]<-34
# sorteos_anteriores[89,3]<-2
# sorteos_anteriores[89,4]<-46
# sorteos_anteriores[89,5]<-18
# sorteos_anteriores[89,6]<-37
# sorteos_anteriores[89,7]<-30
# sorteos_anteriores[89,8]<-7
# # 06/02/2016
# sorteos_anteriores[90,1]<-11
# sorteos_anteriores[90,2]<-46
# sorteos_anteriores[90,3]<-20
# sorteos_anteriores[90,4]<-38
# sorteos_anteriores[90,5]<-6
# sorteos_anteriores[90,6]<-26
# sorteos_anteriores[90,7]<-21
# sorteos_anteriores[90,8]<-6
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# # 15/12/2016
# sorteos_anteriores[61,1]<-38
# sorteos_anteriores[61,2]<-31
# sorteos_anteriores[61,3]<-16
# sorteos_anteriores[61,4]<-21
# sorteos_anteriores[61,5]<-17
# sorteos_anteriores[61,6]<-26
# sorteos_anteriores[61,7]<-3
# sorteos_anteriores[61,8]<-3
# # 10/12/2016
# sorteos_anteriores[62,1]<-37
# sorteos_anteriores[62,2]<-47
# sorteos_anteriores[62,3]<-9
# sorteos_anteriores[62,4]<-15
# sorteos_anteriores[62,5]<-49
# sorteos_anteriores[62,6]<-25
# sorteos_anteriores[62,7]<-40
# sorteos_anteriores[62,8]<-6
# # 07/05/2016
# sorteos_anteriores[63,1]<-21
# sorteos_anteriores[63,2]<-5
# sorteos_anteriores[63,3]<-4
# sorteos_anteriores[63,4]<-36
# sorteos_anteriores[63,5]<-18
# sorteos_anteriores[63,6]<-16
# sorteos_anteriores[63,7]<-23
# sorteos_anteriores[63,8]<-9
# # 05/05/2016
# sorteos_anteriores[64,1]<-49
# sorteos_anteriores[64,2]<-8
# sorteos_anteriores[64,3]<-42
# sorteos_anteriores[64,4]<-46
# sorteos_anteriores[64,5]<-26
# sorteos_anteriores[64,6]<-48
# sorteos_anteriores[64,7]<-40
# sorteos_anteriores[64,8]<-8
# # 30/04/2016
# sorteos_anteriores[65,1]<-31
# sorteos_anteriores[65,2]<-48
# sorteos_anteriores[65,3]<-41
# sorteos_anteriores[65,4]<-4
# sorteos_anteriores[65,5]<-43
# sorteos_anteriores[65,6]<-13
# sorteos_anteriores[65,7]<-34
# sorteos_anteriores[65,8]<-7
# # 28/04/2016
# sorteos_anteriores[66,1]<-33
# sorteos_anteriores[66,2]<-35
# sorteos_anteriores[66,3]<-3
# sorteos_anteriores[66,4]<-43
# sorteos_anteriores[66,5]<-44
# sorteos_anteriores[66,6]<-10
# sorteos_anteriores[66,7]<-20
# sorteos_anteriores[66,8]<-2
# # 23/04/2016
# sorteos_anteriores[67,1]<-40
# sorteos_anteriores[67,2]<-26
# sorteos_anteriores[67,3]<-6
# sorteos_anteriores[67,4]<-8
# sorteos_anteriores[67,5]<-5
# sorteos_anteriores[67,6]<-39
# sorteos_anteriores[67,7]<-2
# sorteos_anteriores[67,8]<-3
# # 21/04/2016
# sorteos_anteriores[68,1]<-31
# sorteos_anteriores[68,2]<-1
# sorteos_anteriores[68,3]<-25
# sorteos_anteriores[68,4]<-2
# sorteos_anteriores[68,5]<-44
# sorteos_anteriores[68,6]<-6
# sorteos_anteriores[68,7]<-49
# sorteos_anteriores[68,8]<-6
# # 16/04/2016
# sorteos_anteriores[69,1]<-2
# sorteos_anteriores[69,2]<-31
# sorteos_anteriores[69,3]<-3
# sorteos_anteriores[69,4]<-40
# sorteos_anteriores[69,5]<-16
# sorteos_anteriores[69,6]<-12
# sorteos_anteriores[69,7]<-23
# sorteos_anteriores[69,8]<-9
# # 14/04/2016
# sorteos_anteriores[70,1]<-27
# sorteos_anteriores[70,2]<-48
# sorteos_anteriores[70,3]<-31
# sorteos_anteriores[70,4]<-2
# sorteos_anteriores[70,5]<-29
# sorteos_anteriores[70,6]<-11
# sorteos_anteriores[70,7]<-4
# sorteos_anteriores[70,8]<-2
# # 09/04/2016
# sorteos_anteriores[71,1]<-25
# sorteos_anteriores[71,2]<-1
# sorteos_anteriores[71,3]<-30
# sorteos_anteriores[71,4]<-29
# sorteos_anteriores[71,5]<-40
# sorteos_anteriores[71,6]<-17
# sorteos_anteriores[71,7]<-2
# sorteos_anteriores[71,8]<-0
# # 07/04/2016
# sorteos_anteriores[72,1]<-44
# sorteos_anteriores[72,2]<-28
# sorteos_anteriores[72,3]<-22
# sorteos_anteriores[72,4]<-38
# sorteos_anteriores[72,5]<-1
# sorteos_anteriores[72,6]<-11
# sorteos_anteriores[72,7]<-40
# sorteos_anteriores[72,8]<-9
# # 02/04/2016
# sorteos_anteriores[73,1]<-40
# sorteos_anteriores[73,2]<-15
# sorteos_anteriores[73,3]<-7
# sorteos_anteriores[73,4]<-27
# sorteos_anteriores[73,5]<-6
# sorteos_anteriores[73,6]<-32
# sorteos_anteriores[73,7]<-43
# sorteos_anteriores[73,8]<-3
# # 31/03/2016
# sorteos_anteriores[74,1]<-26
# sorteos_anteriores[74,2]<-27
# sorteos_anteriores[74,3]<-1
# sorteos_anteriores[74,4]<-8
# sorteos_anteriores[74,5]<-10
# sorteos_anteriores[74,6]<-12
# sorteos_anteriores[74,7]<-6
# sorteos_anteriores[74,8]<-5
# # 26/03/2016
# sorteos_anteriores[75,1]<-43
# sorteos_anteriores[75,2]<-21
# sorteos_anteriores[75,3]<-48
# sorteos_anteriores[75,4]<-19
# sorteos_anteriores[75,5]<-32
# sorteos_anteriores[75,6]<-28
# sorteos_anteriores[75,7]<-9
# sorteos_anteriores[75,8]<-4
# # 24/04/2016
# sorteos_anteriores[76,1]<-12
# sorteos_anteriores[76,2]<-23
# sorteos_anteriores[76,3]<-40
# sorteos_anteriores[76,4]<-1
# sorteos_anteriores[76,5]<-13
# sorteos_anteriores[76,6]<-43
# sorteos_anteriores[76,7]<-48
# sorteos_anteriores[76,8]<-2
# # 19/03/2016
# sorteos_anteriores[77,1]<-35
# sorteos_anteriores[77,2]<-45
# sorteos_anteriores[77,3]<-21
# sorteos_anteriores[77,4]<-44
# sorteos_anteriores[77,5]<-1
# sorteos_anteriores[77,6]<-12
# sorteos_anteriores[77,7]<-17
# sorteos_anteriores[77,8]<-6
# # 17/03/2016
# sorteos_anteriores[78,1]<-44
# sorteos_anteriores[78,2]<-8
# sorteos_anteriores[78,3]<-36
# sorteos_anteriores[78,4]<-11
# sorteos_anteriores[78,5]<-12
# sorteos_anteriores[78,6]<-18
# sorteos_anteriores[78,7]<-43
# sorteos_anteriores[78,8]<-0
# # 12/03/2016
# sorteos_anteriores[79,1]<-40
# sorteos_anteriores[79,2]<-27
# sorteos_anteriores[79,3]<-12
# sorteos_anteriores[79,4]<-37
# sorteos_anteriores[79,5]<-17
# sorteos_anteriores[79,6]<-23
# sorteos_anteriores[79,7]<-29
# sorteos_anteriores[79,8]<-2
# # 10/03/2016
# sorteos_anteriores[80,1]<-3
# sorteos_anteriores[80,2]<-32
# sorteos_anteriores[80,3]<-49
# sorteos_anteriores[80,4]<-24
# sorteos_anteriores[80,5]<-31
# sorteos_anteriores[80,6]<-8
# sorteos_anteriores[80,7]<-15
# sorteos_anteriores[80,8]<-6
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# # 08/12/2016
# sorteos_anteriores[51,1]<-44
# sorteos_anteriores[51,2]<-21
# sorteos_anteriores[51,3]<-7
# sorteos_anteriores[51,4]<-12
# sorteos_anteriores[51,5]<-46
# sorteos_anteriores[51,6]<-13
# sorteos_anteriores[51,7]<-1
# sorteos_anteriores[51,8]<-4
# # 09/06/2016
# sorteos_anteriores[52,1]<-25
# sorteos_anteriores[52,2]<-41
# sorteos_anteriores[52,3]<-14
# sorteos_anteriores[52,4]<-10
# sorteos_anteriores[52,5]<-2
# sorteos_anteriores[52,6]<-9
# sorteos_anteriores[52,7]<-3
# sorteos_anteriores[52,8]<-4
# # 04/06/2016
# sorteos_anteriores[53,1]<-16
# sorteos_anteriores[53,2]<-20
# sorteos_anteriores[53,3]<-41
# sorteos_anteriores[53,4]<-14
# sorteos_anteriores[53,5]<-1
# sorteos_anteriores[53,6]<-11
# sorteos_anteriores[53,7]<-10
# sorteos_anteriores[53,8]<-1
# # 02/06/2016
# sorteos_anteriores[54,1]<-46
# sorteos_anteriores[54,2]<-27
# sorteos_anteriores[54,3]<-38
# sorteos_anteriores[54,4]<-47
# sorteos_anteriores[54,5]<-35
# sorteos_anteriores[54,6]<-45
# sorteos_anteriores[54,7]<-23
# sorteos_anteriores[54,8]<-6
# # 28/05/2016
# sorteos_anteriores[55,1]<-41
# sorteos_anteriores[55,2]<-20
# sorteos_anteriores[55,3]<-28
# sorteos_anteriores[55,4]<-46
# sorteos_anteriores[55,5]<-30
# sorteos_anteriores[55,6]<-36
# sorteos_anteriores[55,7]<-2
# sorteos_anteriores[55,8]<-1
# # 26/05/2016
# sorteos_anteriores[56,1]<-23
# sorteos_anteriores[56,2]<-47
# sorteos_anteriores[56,3]<-3
# sorteos_anteriores[56,4]<-13
# sorteos_anteriores[56,5]<-11
# sorteos_anteriores[56,6]<-32
# sorteos_anteriores[56,7]<-19
# sorteos_anteriores[56,8]<-0
# # 21/05/2016
# sorteos_anteriores[57,1]<-7
# sorteos_anteriores[57,2]<-15
# sorteos_anteriores[57,3]<-13
# sorteos_anteriores[57,4]<-10
# sorteos_anteriores[57,5]<-38
# sorteos_anteriores[57,6]<-35
# sorteos_anteriores[57,7]<-39
# sorteos_anteriores[57,8]<-4
# # 19/05/2016
# sorteos_anteriores[58,1]<-48
# sorteos_anteriores[58,2]<-30
# sorteos_anteriores[58,3]<-40
# sorteos_anteriores[58,4]<-45
# sorteos_anteriores[58,5]<-1
# sorteos_anteriores[58,6]<-43
# sorteos_anteriores[58,7]<-2
# sorteos_anteriores[58,8]<-3
# # 14/05/2016
# sorteos_anteriores[59,1]<-34
# sorteos_anteriores[59,2]<-10
# sorteos_anteriores[59,3]<-35
# sorteos_anteriores[59,4]<-22
# sorteos_anteriores[59,5]<-12
# sorteos_anteriores[59,6]<-5
# sorteos_anteriores[59,7]<-18
# sorteos_anteriores[59,8]<-9
# # 12/05/2016
# sorteos_anteriores[60,1]<-23
# sorteos_anteriores[60,2]<-18
# sorteos_anteriores[60,3]<-42
# sorteos_anteriores[60,4]<-44
# sorteos_anteriores[60,5]<-25
# sorteos_anteriores[60,6]<-22
# sorteos_anteriores[60,7]<-7
# sorteos_anteriores[60,8]<-2
# 
# 
# 
# 
# 
# 
# 
# 
# # 03/12/2016
# sorteos_anteriores[41,1]<-3
# sorteos_anteriores[41,2]<-5
# sorteos_anteriores[41,3]<-13
# sorteos_anteriores[41,4]<-43
# sorteos_anteriores[41,5]<-8
# sorteos_anteriores[41,6]<-21
# sorteos_anteriores[41,7]<-46
# sorteos_anteriores[41,8]<-8
# # 09/07/2016
# sorteos_anteriores[42,1]<-40
# sorteos_anteriores[42,2]<-45
# sorteos_anteriores[42,3]<-37
# sorteos_anteriores[42,4]<-4
# sorteos_anteriores[42,5]<-5
# sorteos_anteriores[42,6]<-41
# sorteos_anteriores[42,7]<-13
# sorteos_anteriores[42,8]<-6
# # 07/07/2016
# sorteos_anteriores[43,1]<-20
# sorteos_anteriores[43,2]<-7
# sorteos_anteriores[43,3]<-23
# sorteos_anteriores[43,4]<-34
# sorteos_anteriores[43,5]<-29
# sorteos_anteriores[43,6]<-15
# sorteos_anteriores[43,7]<-4
# sorteos_anteriores[43,8]<-8
# # 02/07/2016
# sorteos_anteriores[44,1]<-15
# sorteos_anteriores[44,2]<-14
# sorteos_anteriores[44,3]<-16
# sorteos_anteriores[44,4]<-40
# sorteos_anteriores[44,5]<-4
# sorteos_anteriores[44,6]<-18
# sorteos_anteriores[44,7]<-30
# sorteos_anteriores[44,8]<-7
# # 30/06/2016
# sorteos_anteriores[45,1]<-1
# sorteos_anteriores[45,2]<-30
# sorteos_anteriores[45,3]<-43
# sorteos_anteriores[45,4]<-31
# sorteos_anteriores[45,5]<-41
# sorteos_anteriores[45,6]<-6
# sorteos_anteriores[45,7]<-33
# sorteos_anteriores[45,8]<-3
# # 25/06/2016
# sorteos_anteriores[46,1]<-19
# sorteos_anteriores[46,2]<-22
# sorteos_anteriores[46,3]<-37
# sorteos_anteriores[46,4]<-34
# sorteos_anteriores[46,5]<-6
# sorteos_anteriores[46,6]<-21
# sorteos_anteriores[46,7]<-16
# sorteos_anteriores[46,8]<-3
# # 26/06/2016
# sorteos_anteriores[47,1]<-33
# sorteos_anteriores[47,2]<-9
# sorteos_anteriores[47,3]<-20
# sorteos_anteriores[47,4]<-21
# sorteos_anteriores[47,5]<-41
# sorteos_anteriores[47,6]<-16
# sorteos_anteriores[47,7]<-26
# sorteos_anteriores[47,8]<-7
# # 18/06/2016
# sorteos_anteriores[48,1]<-2
# sorteos_anteriores[48,2]<-16
# sorteos_anteriores[48,3]<-14
# sorteos_anteriores[48,4]<-44
# sorteos_anteriores[48,5]<-10
# sorteos_anteriores[48,6]<-27
# sorteos_anteriores[48,7]<-24
# sorteos_anteriores[48,8]<-8
# # 16/06/2016
# sorteos_anteriores[49,1]<-9
# sorteos_anteriores[49,2]<-19
# sorteos_anteriores[49,3]<-49
# sorteos_anteriores[49,4]<-15
# sorteos_anteriores[49,5]<-21
# sorteos_anteriores[49,6]<-8
# sorteos_anteriores[49,7]<-44
# sorteos_anteriores[49,8]<-5
# # 11/06/2016
# sorteos_anteriores[50,1]<-17
# sorteos_anteriores[50,2]<-38
# sorteos_anteriores[50,3]<-46
# sorteos_anteriores[50,4]<-26
# sorteos_anteriores[50,5]<-36
# sorteos_anteriores[50,6]<-37
# sorteos_anteriores[50,7]<-20
# sorteos_anteriores[50,8]<-3
# 
# # 01/12/2016
# sorteos_anteriores[31,1]<-40
# sorteos_anteriores[31,2]<-30
# sorteos_anteriores[31,3]<-45
# sorteos_anteriores[31,4]<-22
# sorteos_anteriores[31,5]<-42
# sorteos_anteriores[31,6]<-33
# sorteos_anteriores[31,7]<-31
# sorteos_anteriores[31,8]<-7
# # 11/08/2016
# sorteos_anteriores[32,1]<-20
# sorteos_anteriores[32,2]<-34
# sorteos_anteriores[32,3]<-11
# sorteos_anteriores[32,4]<-40
# sorteos_anteriores[32,5]<-31
# sorteos_anteriores[32,6]<-13
# sorteos_anteriores[32,7]<-24
# sorteos_anteriores[32,8]<-8
# # 06/08/2016
# sorteos_anteriores[33,1]<-30
# sorteos_anteriores[33,2]<-47
# sorteos_anteriores[33,3]<-17
# sorteos_anteriores[33,4]<-43
# sorteos_anteriores[33,5]<-39
# sorteos_anteriores[33,6]<-12
# sorteos_anteriores[33,7]<-32
# sorteos_anteriores[33,8]<-2
# # 04/08/2016
# sorteos_anteriores[34,1]<-28
# sorteos_anteriores[34,2]<-21
# sorteos_anteriores[34,3]<-14
# sorteos_anteriores[34,4]<-8
# sorteos_anteriores[34,5]<-5
# sorteos_anteriores[34,6]<-12
# sorteos_anteriores[34,7]<-27
# sorteos_anteriores[34,8]<-6
# # 30/07/2016
# sorteos_anteriores[35,1]<-34
# sorteos_anteriores[35,2]<-28
# sorteos_anteriores[35,3]<-30
# sorteos_anteriores[35,4]<-11
# sorteos_anteriores[35,5]<-32
# sorteos_anteriores[35,6]<-24
# sorteos_anteriores[35,7]<-25
# sorteos_anteriores[35,8]<-5
# # 28/07/2016
# sorteos_anteriores[36,1]<-2
# sorteos_anteriores[36,2]<-20
# sorteos_anteriores[36,3]<-10
# sorteos_anteriores[36,4]<-40
# sorteos_anteriores[36,5]<-06
# sorteos_anteriores[36,6]<-38
# sorteos_anteriores[36,7]<-45
# sorteos_anteriores[36,8]<-3
# # 23/07/2016
# sorteos_anteriores[37,1]<-25
# sorteos_anteriores[37,2]<-36
# sorteos_anteriores[37,3]<-46
# sorteos_anteriores[37,4]<-12
# sorteos_anteriores[37,5]<-6
# sorteos_anteriores[37,6]<-20
# sorteos_anteriores[37,7]<-2
# # 21/07/2016
# sorteos_anteriores[38,1]<-22
# sorteos_anteriores[38,2]<-36
# sorteos_anteriores[38,3]<-47
# sorteos_anteriores[38,4]<-42
# sorteos_anteriores[38,5]<-5
# sorteos_anteriores[38,6]<-4
# sorteos_anteriores[38,7]<-6
# sorteos_anteriores[38,8]<-4
# # 16/07/2016
# sorteos_anteriores[39,1]<-12
# sorteos_anteriores[39,2]<-16
# sorteos_anteriores[39,3]<-43
# sorteos_anteriores[39,4]<-32
# sorteos_anteriores[39,5]<-45
# sorteos_anteriores[39,6]<-28
# sorteos_anteriores[39,7]<-19
# sorteos_anteriores[39,8]<-2
# # 14/07/2016
# sorteos_anteriores[40,1]<-10
# sorteos_anteriores[40,2]<-41
# sorteos_anteriores[40,3]<-17
# sorteos_anteriores[40,4]<-36
# sorteos_anteriores[40,5]<-26
# sorteos_anteriores[40,6]<-3
# sorteos_anteriores[40,7]<-11
# sorteos_anteriores[40,8]<-8
# 
# 
# 
# sorteos_anteriores[37,8]<-6
# 
# 
# # 26/11/2016
# sorteos_anteriores[21,1]<-48
# sorteos_anteriores[21,2]<-22
# sorteos_anteriores[21,3]<-28
# sorteos_anteriores[21,4]<-2
# sorteos_anteriores[21,5]<-8
# sorteos_anteriores[21,6]<-15
# sorteos_anteriores[21,7]<-29
# sorteos_anteriores[21,8]<-6
# #10/09/2016
# sorteos_anteriores[22,1]<-24
# sorteos_anteriores[22,2]<-44
# sorteos_anteriores[22,3]<-38
# sorteos_anteriores[22,4]<-34
# sorteos_anteriores[22,5]<-39
# sorteos_anteriores[22,6]<-28
# sorteos_anteriores[22,7]<-6
# sorteos_anteriores[22,8]<-2
# #08/09/2016
# sorteos_anteriores[23,1]<-5
# sorteos_anteriores[23,2]<-4
# sorteos_anteriores[23,3]<-46
# sorteos_anteriores[23,4]<-29
# sorteos_anteriores[23,5]<-42
# sorteos_anteriores[23,6]<-7
# sorteos_anteriores[23,7]<-43
# sorteos_anteriores[23,8]<-7
# #03/09/2016
# sorteos_anteriores[24,1]<-30
# sorteos_anteriores[24,2]<-31
# sorteos_anteriores[24,3]<-14
# sorteos_anteriores[24,4]<-4
# sorteos_anteriores[24,5]<-44
# sorteos_anteriores[24,6]<-34
# sorteos_anteriores[24,7]<-20
# sorteos_anteriores[24,8]<-5
# #01/09/2016
# sorteos_anteriores[25,1]<-31
# sorteos_anteriores[25,2]<-35
# sorteos_anteriores[25,3]<-17
# sorteos_anteriores[25,4]<-48
# sorteos_anteriores[25,5]<-19
# sorteos_anteriores[25,6]<-21
# sorteos_anteriores[25,7]<-4
# sorteos_anteriores[25,8]<-7
# #27/08/2016
# sorteos_anteriores[26,1]<-32
# sorteos_anteriores[26,2]<-45
# sorteos_anteriores[26,3]<-14
# sorteos_anteriores[26,4]<-9
# sorteos_anteriores[26,5]<-6
# sorteos_anteriores[26,6]<-36
# sorteos_anteriores[26,7]<-10
# sorteos_anteriores[26,8]<-4
# #25/08/2016
# sorteos_anteriores[27,1]<-26
# sorteos_anteriores[27,2]<-7
# sorteos_anteriores[27,3]<-35
# sorteos_anteriores[27,4]<-10
# sorteos_anteriores[27,5]<-40
# sorteos_anteriores[27,6]<-16
# sorteos_anteriores[27,7]<-49
# sorteos_anteriores[27,8]<-8
# #20/08/2016
# sorteos_anteriores[28,1]<-26
# sorteos_anteriores[28,2]<-34
# sorteos_anteriores[28,3]<-17
# sorteos_anteriores[28,4]<-2
# sorteos_anteriores[28,5]<-11
# sorteos_anteriores[28,6]<-40
# sorteos_anteriores[28,7]<-22
# sorteos_anteriores[28,8]<-0
# #18/08/2016
# sorteos_anteriores[29,1]<-33
# sorteos_anteriores[29,2]<-39
# sorteos_anteriores[29,3]<-37
# sorteos_anteriores[29,4]<-9
# sorteos_anteriores[29,5]<-14
# sorteos_anteriores[29,6]<-22
# sorteos_anteriores[29,7]<-46
# sorteos_anteriores[29,8]<-3
# #13/08/2016
# sorteos_anteriores[30,1]<-40
# sorteos_anteriores[30,2]<-24
# sorteos_anteriores[30,3]<-33
# sorteos_anteriores[30,4]<-45
# sorteos_anteriores[30,5]<-10
# sorteos_anteriores[30,6]<-13
# sorteos_anteriores[30,7]<-32
# sorteos_anteriores[30,8]<-3
# 
# #10/11/2016
# sorteos_anteriores[1,1]<-48
# sorteos_anteriores[1,2]<-22
# sorteos_anteriores[1,3]<-28
# sorteos_anteriores[1,4]<-2
# sorteos_anteriores[1,5]<-8
# sorteos_anteriores[1,6]<-15
# sorteos_anteriores[1,7]<-29
# sorteos_anteriores[1,8]<-6
# # 12/11/2016
# sorteos_anteriores[2,1]<-33
# sorteos_anteriores[2,2]<-5
# sorteos_anteriores[2,3]<-47
# sorteos_anteriores[2,4]<-22
# sorteos_anteriores[2,5]<-48
# sorteos_anteriores[2,6]<-26
# sorteos_anteriores[2,7]<-4
# sorteos_anteriores[2,8]<-0
# # 5/11/2016
# sorteos_anteriores[3,1]<-14
# sorteos_anteriores[3,2]<-7
# sorteos_anteriores[3,3]<-49
# sorteos_anteriores[3,4]<-4
# sorteos_anteriores[3,5]<-30
# sorteos_anteriores[3,6]<-46
# sorteos_anteriores[3,7]<-29
# sorteos_anteriores[3,8]<-8
# # 3/11/2016
# sorteos_anteriores[4,1]<-30
# sorteos_anteriores[4,2]<-29
# sorteos_anteriores[4,3]<-46
# sorteos_anteriores[4,4]<-21
# sorteos_anteriores[4,5]<-12
# sorteos_anteriores[4,6]<-44
# sorteos_anteriores[4,7]<-45
# sorteos_anteriores[4,8]<-2
# # 29/10/2016
# sorteos_anteriores[5,1]<-38
# sorteos_anteriores[5,2]<-26
# sorteos_anteriores[5,3]<-4
# sorteos_anteriores[5,4]<-16
# sorteos_anteriores[5,5]<-14
# sorteos_anteriores[5,6]<-47
# sorteos_anteriores[5,7]<-22
# sorteos_anteriores[5,8]<-8
# # 27/10/2016
# sorteos_anteriores[6,1]<-4
# sorteos_anteriores[6,2]<-23
# sorteos_anteriores[6,3]<-2
# sorteos_anteriores[6,4]<-22
# sorteos_anteriores[6,5]<-35
# sorteos_anteriores[6,6]<-32
# sorteos_anteriores[6,7]<-21
# sorteos_anteriores[6,8]<-8
# # 22/10/2016
# sorteos_anteriores[7,1]<-31
# sorteos_anteriores[7,2]<-13
# sorteos_anteriores[7,3]<-15
# sorteos_anteriores[7,4]<-43
# sorteos_anteriores[7,5]<-12
# sorteos_anteriores[7,6]<-32
# sorteos_anteriores[7,7]<-6
# sorteos_anteriores[7,8]<-8
# # 20/11/2016
# sorteos_anteriores[8,1]<-21
# sorteos_anteriores[8,2]<-18
# sorteos_anteriores[8,3]<-5
# sorteos_anteriores[8,4]<-7
# sorteos_anteriores[8,5]<-20
# sorteos_anteriores[8,6]<-15
# sorteos_anteriores[8,7]<-17
# sorteos_anteriores[8,8]<-8
# # 15/10/2016
# sorteos_anteriores[9,1]<-49
# sorteos_anteriores[9,2]<-27
# sorteos_anteriores[9,3]<-43
# sorteos_anteriores[9,4]<-1
# sorteos_anteriores[9,5]<-22
# sorteos_anteriores[9,6]<-42
# sorteos_anteriores[9,7]<-8
# sorteos_anteriores[9,8]<-2
# # 13/10/2016
# sorteos_anteriores[10,1]<-18
# sorteos_anteriores[10,2]<-1
# sorteos_anteriores[10,3]<-36
# sorteos_anteriores[10,4]<-21
# sorteos_anteriores[10,5]<-32
# sorteos_anteriores[10,6]<-5
# sorteos_anteriores[10,7]<-45
# sorteos_anteriores[10,8]<-8
# #19/11/2016
# sorteos_anteriores[11,1]<-48
# sorteos_anteriores[11,2]<-39
# sorteos_anteriores[11,3]<-15
# sorteos_anteriores[11,4]<-46
# sorteos_anteriores[11,5]<-6
# sorteos_anteriores[11,6]<-14
# sorteos_anteriores[11,7]<-41
# sorteos_anteriores[11,8]<-0
# #17/11/2016
# sorteos_anteriores[12,1]<-2
# sorteos_anteriores[12,2]<-30
# sorteos_anteriores[12,3]<-16
# sorteos_anteriores[12,4]<-21
# sorteos_anteriores[12,5]<-9
# sorteos_anteriores[12,6]<-31
# sorteos_anteriores[12,7]<-34
# sorteos_anteriores[12,8]<-1
# # 8/10/2016
# sorteos_anteriores[13,1]<-9
# sorteos_anteriores[13,2]<-49
# sorteos_anteriores[13,3]<-29
# sorteos_anteriores[13,4]<-4
# sorteos_anteriores[13,5]<-20
# sorteos_anteriores[13,6]<-41
# sorteos_anteriores[13,7]<-24
# sorteos_anteriores[13,8]<-2
# # 6/10/2016
# sorteos_anteriores[14,1]<-30
# sorteos_anteriores[14,2]<-41
# sorteos_anteriores[14,3]<-26
# sorteos_anteriores[14,4]<-19
# sorteos_anteriores[14,5]<-3
# sorteos_anteriores[14,6]<-23
# sorteos_anteriores[14,7]<-13
# sorteos_anteriores[14,8]<-4
# # 01/10/2016
# sorteos_anteriores[15,1]<-16
# sorteos_anteriores[15,2]<-42
# sorteos_anteriores[15,3]<-20
# sorteos_anteriores[15,4]<-2
# sorteos_anteriores[15,5]<-35
# sorteos_anteriores[15,6]<-7
# sorteos_anteriores[15,7]<-10
# sorteos_anteriores[15,8]<-6
# #29/09/2016
# sorteos_anteriores[16,1]<-42
# sorteos_anteriores[16,2]<-14
# sorteos_anteriores[16,3]<-8
# sorteos_anteriores[16,4]<-28
# sorteos_anteriores[16,5]<-40
# sorteos_anteriores[16,6]<-39
# sorteos_anteriores[16,7]<-49
# sorteos_anteriores[16,8]<-2
# #24/19/2016
# sorteos_anteriores[17,1]<-45
# sorteos_anteriores[17,2]<-42
# sorteos_anteriores[17,3]<-4
# sorteos_anteriores[17,4]<-9
# sorteos_anteriores[17,5]<-48
# sorteos_anteriores[17,6]<-21
# sorteos_anteriores[17,7]<-27
# sorteos_anteriores[17,8]<-8
# #22/09/2016
# sorteos_anteriores[18,1]<-49
# sorteos_anteriores[18,2]<-42
# sorteos_anteriores[18,3]<-9
# sorteos_anteriores[18,4]<-43
# sorteos_anteriores[18,5]<-15
# sorteos_anteriores[18,6]<-18
# sorteos_anteriores[18,7]<-41
# sorteos_anteriores[18,8]<-6
# #17/10/2016
# sorteos_anteriores[19,1]<-20
# sorteos_anteriores[19,2]<-14
# sorteos_anteriores[19,3]<-32
# sorteos_anteriores[19,4]<-22
# sorteos_anteriores[19,5]<-8
# sorteos_anteriores[19,6]<-28
# sorteos_anteriores[19,7]<-45
# sorteos_anteriores[19,8]<-2
# #15/09/2016
# sorteos_anteriores[20,1]<-40
# sorteos_anteriores[20,2]<-14
# sorteos_anteriores[20,3]<-24
# sorteos_anteriores[20,4]<-7
# sorteos_anteriores[20,5]<-35
# sorteos_anteriores[20,6]<-34
# sorteos_anteriores[20,7]<-25
# sorteos_anteriores[20,8]<-3
# 


saveRDS(sorteos_anteriores, file="sorteos-anteriores.rds")
