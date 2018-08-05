#-------------------------------------------------
#
# Project created by QtCreator 2017-05-31T12:32:23
#
#-------------------------------------------------

QT       += core gui svg network concurrent
CONFIG   += c++14

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = theSlate
TEMPLATE = app


macx {
    QT += macextras
    ICON = icon.icns
    LIBS += -framework CoreFoundation
    QMAKE_INFO_PLIST = Info.plist
}

unix:!macx {
    QT += thelib
    TARGET = theslate
    LIBS +=  -L../SyntaxHighlightingPlugins/ -lSyntaxHighlightingPlugins
}

win32 {
    QT += thelib
    INCLUDEPATH += "C:/Program Files/thelibs/include"
    LIBS += -L"C:/Program Files/thelibs/lib" -lthe-libs
    CONFIG(debug, debug|release): LIBS += -L../SyntaxHighlightingPlugins/debug/
    else: LIBS += -L../SyntaxHighlightingPlugins/release/
    LIBS += -lSyntaxHighlightingPlugins
    RC_FILE = icon.rc
}

macx {
    INCLUDEPATH += "/usr/local/include/the-libs"
    LIBS += -L/usr/local/lib -lthe-libs
}


# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        mainwindow.cpp \
    tabbutton.cpp \
    texteditor.cpp \
    aboutwindow.cpp \
    syntaxhighlighter.cpp \
    SourceControl/gitintegration.cpp \
    textparts/findreplace.cpp \
    exitsavedialog.cpp \
    textparts/topnotification.cpp \
    textparts/mergetool.cpp

HEADERS += \
        mainwindow.h \
    tabbutton.h \
    texteditor.h \
    aboutwindow.h \
    syntaxhighlighter.h \
    SourceControl/gitintegration.h \
    textparts/findreplace.h \
    exitsavedialog.h \
    textparts/topnotification.h \
    textparts/mergetool.h \
    syntaxhighlighting/syntaxhighlighting.h

FORMS += \
        mainwindow.ui \
    aboutwindow.ui \
    textparts/findreplace.ui \
    exitsavedialog.ui \
    textparts/topnotification.ui \
    textparts/mergetool.ui

RESOURCES += \
    icons.qrc \
    files.qrc

TRANSLATIONS += translations/vi_VN.ts \
    translations/nl_NL.ts

# Turn off stripping as this causes the install to fail :(
QMAKE_STRIP = echo

unix:!macx {
    target.path = /usr/bin

    translations.path = /usr/share/theslate/translations
    translations.files = translations/*

    desktop.path = /usr/share/applications
    desktop.files = theslate.desktop

    icon.path = /usr/share/icons/hicolor/scalable/apps/
    icon.files = icons/theslate.svg

    headers.path = /usr/include/theslate
    header.files = syntaxhighlighting/syntaxhighlighting.h

    INSTALLS += target translations desktop icon headers
}

macx {
    translations.files = translations/
    translations.path = Contents/translations

    locversion.files = localisedresources/
    locversion.path = Contents/Resources

    QMAKE_BUNDLE_DATA = translations locversion

    QMAKE_POST_LINK += $$quote(cp $${PWD}/icon.icns $${PWD}/app-dmg-background.png $${PWD}/node-appdmg-config.json $${OUT_PWD}/..)
}

DISTFILES += \
    theslate.desktop \
    app-dmg-background.png \
    icon.icns \
    Info.plist