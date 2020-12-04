package example

case class Entry(tsid: String, value: Double)

class Hello {
  def sayHello: String = "Hello"

  def getData: Seq[Entry] = {
    return Seq(Entry("some_id", 42.0))
  }
}