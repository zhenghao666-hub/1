#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Comment.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CommentModel commentModel;
    engine.rootContext()->setContextProperty("commentmodel", &commentModel);
    qmlRegisterType<CommentModel>("CommentModels", 1, 0, "CommentModel");

    const QUrl url(QStringLiteral("qrc:/video/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
