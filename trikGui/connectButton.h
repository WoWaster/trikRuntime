/* Copyright 2014 CyberTech Labs Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. */

#pragma once

#include <QtCore/qglobal.h>

#if QT_VERSION < QT_VERSION_CHECK(5, 0, 0)
	#include <QtGui/QPushButton>
#else
	#include <QtWidgets/QPushButton>
#endif

namespace trikGui {

class ConnectButton : public QPushButton
{
	Q_OBJECT

public:
	ConnectButton();

signals:
	void upPressed();
	void downPressed();

protected:
	void keyPressEvent(QKeyEvent *event) override;
	void paintEvent(QPaintEvent *event) override;
};

}
