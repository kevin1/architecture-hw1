#matrix mult
#take in N as arg & gen NxN matrix with all vals 250
#run on havana

import sys

def main():
	n = int(sys.argv[1])
	array1 = array2 = [[250 for x in range(n)] for y in range(n)]	
	result = [[0 for x in range(n)]for y in range(n)]

	for i in range(0, n):
		for j in range(0, n):
			for k in range(0, n):
				result[i][j] += array1[i][k] * array2[k][j]
	#print result

if __name__ == "__main__":
	main()

