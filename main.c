#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

void     ft_swap(unsigned int *a, unsigned int *b);
char     *ft_strdup(const char *s);  
char     *ft_strcpy(char *dest, char *src);
size_t   ft_strlen(const char  * str);
size_t   ft_read(int fd, void *buf, int len);
 size_t   ft_write(int fd, void *buf, int len);




int test_strcpy(char *src, char *dest) {
    ft_strcpy(src, dest);
    printf("Test strcpy----------------------\n");
    printf("Source:      [%s]\n", src);
    printf("Destination: [%s]\n", dest);
    return 0;
} 

int test_strlen(char * str) {
    printf("Test strlen----------------------\n");
    printf("Src Len %ld \n", ft_strlen(str));
}

int main() {
    char src[50] = "Test string Source \0";
    unsigned int    a =   0xDeADBEEF;
    unsigned int    b =   0xc0DEF00D;
    char dst[50] = "TestStringDestination\0";

    printf("ret strcpy[%s]\ndest:[%s]\nsrc :[%s]\n" ,ft_strcpy(src, dst), dst, src);
    printf("[a]=[%x] [b]=[%x] \n", a, b);
    ft_swap(&a , &b);
    printf("[a]=[%x] [b]=[%x] \n", a, b );
    char *dup = ft_strdup(src);
    if (dup != NULL) {
        test_strcpy(src, dup);
        test_strlen(dup);
        free(dup);
        printf("%p\n", dup);
        dup=NULL;
        printf("%s", dup);
        free(dup);
   
    void * buf ;
        
        printf("%ld",      ft_write(1,"yolo\n",5));
    } else {
        printf("Failed to duplicate string.\n");
    }
    return 0;
}