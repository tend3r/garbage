#include <QCoreApplication>
#include <filecount.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    FileCount file;
    file.returnFileSize("C:\Qt");
    return a.exec();
}
