#ifndef FILECOUNT_H
#define FILECOUNT_H

#include <QtGlobal>


class FileCount
{
public:
    FileCount();
    qint64 returnFileSize (const QString &path);

};

#endif // FILECOUNT_H
