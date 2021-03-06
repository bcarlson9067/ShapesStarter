/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import SpriteKit

class GameScene: SKScene {
  let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]
  
  override func didMove(to view: SKView) {
    setupPlayerAndObstacles()
  }
  func setupPlayerAndObstacles() {
    addObstacle()
  }
  func addObstacle() {
    addCircleObstacle()
  }
  func addCircleObstacle() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: -200))
    path.addLine(to: CGPoint(x: 0, y: -160))
    path.addArc(withCenter: CGPoint.zero, radius: 160, startAngle: CGFloat(3.0*Double.pi/2), endAngle: CGFloat(0.0), clockwise: true)
    path.addLine(to: CGPoint(x: 200, y: 0))
    path.addArc(withCenter: CGPoint.zero, radius: 200, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0*Double.pi/2), clockwise: false)
    
    let obstacle = obstacleByDublicatingPath(path, clockwise: true)
    obstacle.position = CGPoint(x: size.width/2, y: size.height/2)
    addChild(obstacle)
    
    let rotateAction = SKAction.rotate(byAngle: CGFloat(2*Double.pi), duration: 8.0)
    obstacle.run(SKAction.repeatForever(rotateAction))
    
  }
  func obstacleByDublicatingPath(_ path: UIBezierPath, clockwise: Bool) -> SKNode {
    let container = SKNode()
    var rotationFactor = CGFloat(Double.pi/2)
    if !clockwise {
      rotationFactor *= -1
    }
    
    for i in 0...3 {
      let section = SKShapeNode(path: path.cgPath)
      section.fillColor = colors[i]
      section.strokeColor = colors[i]
      section.zRotation = rotationFactor * CGFloat(i)
      container.addChild(section)
    }
    return container
  }
  
  
}
