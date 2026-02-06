//////////////////////////////////////
// NOMES:
// - Maria Eduarda Barriquello 
// - Vitor Dallabona
//////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*** Tree node ***/
struct Student {    
    char name[70];
    unsigned int registration;
    char course[35];          
    unsigned int birthday;     
    char hometown[35];    
    struct Student *left, *right;
};
 
/*** Tree descriptor ***/
struct BinarySerachTree {
    int size;
    struct Student *root;
};

void RemoveStudent_asm(struct BinarySerachTree *bst, unsigned int registration);
struct Student *CreateStudent_asm(char *name, unsigned int birthday, char *course, unsigned int registration, char *hometown);
struct Student *Insert_r_asm(struct Student *subTreeRoot, struct Student *newStudent);

// Receives a nonempty search tree root. Deletes
// the root of the tree and rearranges the
// tree so that it remains a search tree.
// Returns the new root.
struct Student *DeleteSubTreeRoot(struct Student *root) {  
    
    struct Student *p, *q;
        
    if (root->left == NULL) {
       q = root->right;
       free (root);
       return q;
    }
    
    p = root; 
    q = root->left;
    while (q->right != NULL) {
       p = q; 
       q = q->right;
    }
    
    // q is the predecessor of root
    // p is the parent of q
    if (p != root) {
       p->right = q->left;
       q->left = root->left;
    }
    
    q->right = root->right;
    free (root);
    
    return q;
}

/*** Inserts a new node in the tree ***/
void InsertNewStudent (struct BinarySerachTree *bst, char *name, unsigned int birthday, char *course, unsigned int registration, char *hometown) {

    struct Student *newStudent = CreateStudent_asm(name, birthday, course, registration, hometown);

    (bst->root == NULL) ? bst->root = newStudent : Insert_r_asm (bst->root, newStudent);
    
    bst->size++;
}

/*** Prints the students following the ascending registration order ***/
void PrintInOrder(struct Student *root) {

    /**** IMPORTANTE ****/ 
    // Na implementação assemby,
    // o array buffer[] deve alocado no stack frame 
    // da função PrintInOrder()
    char buffer[] = "%d %s %d %s %s\n";  

    if (root != NULL) {
        PrintInOrder(root->left);
        printf(buffer, root->registration, root->name, root->birthday, root->hometown, root->course);
        PrintInOrder(root->right);
    }
}

int main() {

    struct BinarySerachTree bst;
    bst.root = NULL;    
    bst.size = 0;

    InsertNewStudent(&bst,"Ozzy Osbourne", 1948, "Heavy Metal", 666, "Aston");       
    InsertNewStudent(&bst,"Andreas Kisser", 1968, "Thrash Metal", 670, "Sao Bernardo do Campo");       
    InsertNewStudent(&bst,"Vince Neil", 1961, "Hard Rock", 668, "Hollywood");        
    InsertNewStudent(&bst,"Lemmy Kilmister",1945, "Extreme Rock and Roll", 660, "Stoke-on-Trent");   
    InsertNewStudent(&bst,"Mick Jagger",1943, "Rock and Roll", 665, "Dartford");     
    InsertNewStudent(&bst,"Robert Johnson",1911, "Delta Blues", 671, "Greenwood");    
    
    printf("Initial tree. Size: %d\n", bst.size);    
    PrintInOrder(bst.root);
    
    printf("\nRemove test...\n");
    
    RemoveStudent_asm(&bst, 666);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 333);   // Student not present
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 665);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 670);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 668);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 671);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 666);   // Already removed
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);
    RemoveStudent_asm(&bst, 660);
    printf("size: %d\n",bst.size);
    PrintInOrder(bst.root);   
    

    return 0;
}