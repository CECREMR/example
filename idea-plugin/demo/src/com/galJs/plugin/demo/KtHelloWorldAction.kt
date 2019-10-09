package com.galJs.plugin.demo

import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.PlatformDataKeys
import com.intellij.openapi.ui.Messages

class KtHelloWorldAction : AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
        var sum = 0
        arrayListOf(1, 2, 3).forEach { it -> sum += it }
        val project = e.getData(PlatformDataKeys.PROJECT)
        Messages.showMessageDialog(
                project,
                "Hello World! projectName is %s, sum is %d".format(project?.name, sum),
                "Information",
                Messages.getInformationIcon()
        )
    }
}