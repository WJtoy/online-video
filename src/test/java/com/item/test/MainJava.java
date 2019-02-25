package com.item.test;

public class MainJava {
	
	
	public static void Merge() {
		System.out.println("merge");
	}
	
	public static void  MergeSort(int array[], int p, int r) {
		
		if(p<r) {
			int q=(p+r)/2;
			System.out.println("3");
			MergeSort(array, p, q);
			System.out.println("1");

			MergeSort(array, q+1, r);
			System.out.println("2");
			Merge();
		}
		
	}
	
	public static void main(
			String[] args) {
		int i=0;
		int a[]= {10,9,8,7,6,5,4,3,2,1};
		int len=a.length;
		MergeSort(a, 0, len-1);
		System.out.println(a.length);
		for(i=0;i<len;i++) {
			System.out.println(a[i]+" ");
		}
		
	}

}
