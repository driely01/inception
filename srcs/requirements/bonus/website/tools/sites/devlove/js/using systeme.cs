using systeme;


{
	console.write line("enter la taille: ");
	int n = int.parse(console.readline());
	int[,] t = new int [n,n];

	for (int i=0; i<n; i++)
	{
		for (int j+0; j<n; j++)
		{
			console.writeline("t[{0}{1}]",i,j);
			 t[i,j]=int.parse(console.readline());
		}
	}

	foreach (int d in t)
	{
		console.writeline("{0}",d);
	}

	int som+0;
	for (int i=0; i<n; i++)
	{
		for (int j=0; j<n; j++)
		{
			som += t[i,j];
		}
	}

	console.writeline("la somme est: {0}", som);
	bool test = true;
	for (int i=0; i<n;i++)
	{
		for (int j=0; j<n; j++)
		{
			if (t[i,j] != t[j,i])
			{
				test = false;
			}
		}
	}

	if (test == true)
	{
		console.writeline("symetrique");
	}
	else console.writeline("non symetrique");

	int k=0;
	int[] l = new int[n * n];
	for (int i=0; i<n; i++)
	{
		for (int j=0; j<n; j++)
		{
			l[k]=t[i,j];
			k++;
		}
	}

	for (int i=0; i<n; i++)
	{
		for (int j=0; j<n; j++)
		{
			console.writeline( "{0}",l[k]);
		}
		console.write("\n");
	}

	cponsole.readkey();
}

/*using System;

namespace ConsoleApp1
{
    class Program
    {
        static int[] remp(int n)
        {
            int[] k = new int[n];
            for (int i = 0; i < n; i++)
            {
                tt: Console.Write("k[{0}]: ", i);
                try {k[i] = int.Parse(Console.ReadLine()); }
                catch (Exception) { goto tt; }  
            }
            return k;
        }
        static void affich(int[] k)
        {
            foreach(int d in k)
            {
                Console.Write("{0}  ", d);
            }
        }
        static void moyenne(int[] k)
        {
            int som = 0, moy = 0;
            for(int i = 0; i < k.Length; i++)
            {
                som += k[i];
            }
            moy = som / k.Length;
            Console.WriteLine("la moyenne est: {0}", moy);
        }
        static void tris(int[] k)
        {
            Array.Sort(k);
            //Array.Reverse(k);
        }
        static void Main(string[] args)
        {
            int n;
            ff: Console.Write("entre a nombre: ");
            try { n = int.Parse(Console.ReadLine()); }
            catch (Exception) { goto ff; }
            var k1 = new int[n];
            k1 = remp(n);
            affich(k1);
            Console.WriteLine("\n");
            moyenne(k1);
            tris(k1);
            Console.WriteLine("\n");
            affich(k1);
            Console.ReadKey();
        }
    }
}*/