#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

void    ft_swap(unsigned int *a, unsigned int *b);
char    *ft_strdup(const char *s);  
char    *ft_write(int fd, void *buf, int len);
char    *ft_strcpy(char *src, char * dest);
int     ft_strlen(char  * str);


int test_strcpy(char *src, char *dest) {
    ft_strcpy(dest, src);
    printf("Test strcpy----------------------\n");
    printf("Source:      [%s]\n", src);
    printf("Destination: [%s]\n", dest);
    return 0;
} 

int test_strlen(char * str) {
    printf("Test strlen----------------------\n");
    printf("Src Len %d \n", ft_strlen(str));
}

int main() {
    char *src = "Test string2";
    unsigned int    a =   0xDeADBEEF;
    unsigned int    b =   0xc0DEF00D;

    printf("[a]=[%x] [b]=[%x] \n", a, b);
    ft_swap(&a , &b);
    printf("[a]=[%x] [b]=[%x] \n", a, b );
    char *dup = ft_strdup(src);
    if (dup != NULL) {
        test_strcpy(src, dup);
        test_strlen(dup);
        // free(dup);
        printf("%p\n", dup);
        // dup=NULL;
        printf("%s", dup);
        free(dup);
    } else {
        printf("Failed to duplicate string.\n");
    }
    return 0;
}