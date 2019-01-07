package bucketsortstring;

import java.util.HashMap;
import java.util.Vector;

/**
 *
 * @author netuno
 */
public class BucketSortString {

    public void sort(String[] array) {
        if (array.length == 0) return;  // olha se esta vazio 

        // Determina o tamhanho maximo do array
        int max = 0;
        for (int i = 1; i < array.length; i++) {
            // atualiza o limite maximo do arrey
            if (max < array[i].length()) max = array[i].length();
        }


        // inicializa o bucket
        int bucketCount = 26;   // alfabeto
       
        HashMap<Character, Vector<String>> buckets = new HashMap<Character, Vector<String>>(bucketCount);
        // criação dos buckets
        char a = 'a';
        for (int i = 0; i <= bucketCount; i++, a++){
            buckets.put(a, new Vector<String>());
        }   

        // assign array values into buckets
        for (int i = 0; i < array.length; i++) {
            // obtem a primeira letra da palavra
            String current = array[i];
            char letter = current.toLowerCase().charAt(0);
            buckets.get(letter).add(array[i]);
        }

        // Classifica os buckets e coloca de volta na entrada
        
        int index = 0;  // mantém o índice de array global
        for (char key = 'a'; key <= 'z'; key++) {
            // recuperar o bucker
            Vector<String> bucket = buckets.get(key);

            // inserção no balde
            for (int i = 1; i < bucket.size(); i++){
                // Começo como 1, como uma lista de tamanho 1 já está classificada

                // salva o valor no índice e remove
                String temp = bucket.get(i);
                bucket.remove(i);

                // mova todos os valores um para cima, até encontrarmos a localização do valor salvo
                int j;
                for(j = i-1; j >= 0 && 
                        bucket.get(j).compareToIgnoreCase(temp) > 0; j--){
                    // para "inserir", precisamos adicionar e remover
                    bucket.add(j+1, bucket.get(j));
                    bucket.remove(j);
                }
                // place the saved value in the proper location
                bucket.add(j+1, temp);
            }


            // pile the current bucket back into array
            for (int j = 0; j < bucket.size(); j++) {
                array[index++] = bucket.get(j);
            }
        }
    }
    
}
