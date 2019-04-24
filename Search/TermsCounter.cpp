#include<stdlib.h>
#include<string>
#include<string.h>
#include<iostream>
#include<dirent.h>
#include<cstdio>

using std::string;
using std::cout;
using std::endl;

int main(int argc, char *argv[])
{
    string tcPropsFilePath = "";
    string vxlFilePath = "";
    string txtFilePath = "";
    string csvFilePath = "";
    string args[argc];

    for (int index = 1; index < argc; index++)
    {
        if (strcmp(argv[index], "-vxl") == 0)
        {
            vxlFilePath = argv[++index];
        }
        else if (strcmp(argv[index], "-csv") == 0)
        {
            csvFilePath = argv[++index];
        }
        else if (strcmp(argv[index], "-prop") == 0)
        {
            tcPropsFilePath = argv[++index];
        }
        else if (strcmp(argv[index], "-txt") == 0)
        {
            txtFilePath = argv[++index];
        }
    }

    //string breaker = "java -Xms256M -Xmx2048M -DentityExpansionLimit=2500000 -jar ./bin/Breaker.jar -vxl " + vxlFilePath;
    //system(breaker.c_str());

    DIR *dir;
    struct dirent *lsdir;
    dir = opendir("./bin/temp");

    /* print all the files and directories within directory */
    while ( ( lsdir = readdir(dir) ) != NULL )
    {
        if ((strcmp(lsdir->d_name, ".") != 0) && (strcmp(lsdir->d_name, "..") != 0))
        {
            string vxlTemp = "./bin/temp/" + (string)lsdir->d_name;
            string termsCounter = "java -Xms256M -Xmx2048M -jar ./bin/TermsCounter.jar -prop " + tcPropsFilePath + " -vxl " + vxlTemp + " -csv ./bin/result/" + lsdir->d_name + ".csv" + " -txt ./bin/result/" + lsdir->d_name + ".txt";
            system(termsCounter.c_str());
        }
    }

    closedir(dir);

    string mergeCSV = "java -Xms256M -Xmx2048M -jar ./bin/Merge.jar -csv " + csvFilePath + " -txt " + txtFilePath + " -path ./bin/result/";
    system(mergeCSV.c_str());


    ///Remove temp files
    DIR *diretory;
    struct dirent *lsdiretory;
    diretory = opendir("./bin/temp");

    /* print all the files and directories within directory */
    while ( ( lsdiretory = readdir(diretory) ) != NULL )
    {
        string rmdir = "./bin/temp/" + (string)lsdiretory->d_name;
        remove(rmdir.c_str());
    }

    diretory = opendir("./bin/result");
    /* print all the files and directories within directory */
    while ( ( lsdiretory = readdir(diretory) ) != NULL )
    {
        string rmdir = "./bin/result/" + (string)lsdiretory->d_name;
        remove(rmdir.c_str());
    }
}
