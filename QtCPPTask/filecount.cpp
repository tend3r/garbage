#include "filecount.h"
#include <QDir>
#include <QDebug>

FileCount::FileCount()
{

}

qint64 FileCount::returnFileSize(const QString &path)
{
    QDir dir(path);
    dir.setFilter(QDir::Files | QDir:: Hidden | QDir::NoSymLinks);
    QFileInfoList list (dir.entryInfoList());
    qDebug()<<dir;
    qint64 result = 0;
    for (QFileInfo file : list)
    {
        result += file.size();
        qDebug()<<file.fileName();
        qDebug()<<file.dir();
    }

    qDebug()<<result;
    return result;

}
