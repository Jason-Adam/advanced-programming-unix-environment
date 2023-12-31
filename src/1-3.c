/* List all the files in a directory */
#include "apue.h"
#include <dirent.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  DIR *dp;
  struct dirent *dirp;

  if (argc != 2) {
    printf("usage: ls directory_name\n");
    exit(0);
  }

  if ((dp = opendir(argv[1])) == NULL) {
    err_sys("can't open %s", argv[1]);
  }

  while ((dirp = readdir(dp)) != NULL) {
    printf("%s\n", dirp->d_name);
  }

  closedir(dp);
  exit(0);
}
