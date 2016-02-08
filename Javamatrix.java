public class Javamatrix {

	public static void main(String[] args) {
		final int DIM = Integer.parseInt(args[0]);
		int FILL_VAL = 250;

		int[][] m1 = new int[DIM][DIM], m2 = new int[DIM][DIM], m3 = new int[DIM][DIM];
		for (int i = 0; i < DIM; ++i)
			for (int j = 0; j < DIM; ++j)
				m1[i][j] = m2[i][j] = FILL_VAL;

		for (int i = 0; i < DIM; ++i)
			for (int j = 0; j < DIM; ++j)
				for (int k = 0; k < DIM; ++k)
					m3[i][j] += m1[i][k] * m2[k][j];

	}

}
