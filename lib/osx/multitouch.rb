require "inline"

module OSX
  module MultiTouch
    VERSION = "1.0.0"

    inline do |c|
      c.add_compile_flags "-F/System/Library/PrivateFrameworks",
        "-framework MultitouchSupport"

      c.include "<math.h>"
      c.include "<unistd.h>"
      c.include "<CoreFoundation/CoreFoundation.h>"

      c.prefix <<-"END"
        typedef int MTDeviceRef;
        typedef int (*MTContactCallback)(int, void *, int, double, int);

        MTDeviceRef MTDeviceCreateDefault();
        void MTRegisterContactFrameCallback(MTDeviceRef, MTContactCallback);
        void MTDeviceStart(MTDeviceRef);
        void MTDeviceStop(MTDeviceRef);

        static int counter = 0;
        static VALUE MT_CLASS = 0;

        int callback(int device, void *data, int fingerCount,
                     double time, int frame) {

          if (counter) return 0;
          ++counter;
          printf("wtf?! %x\\n", data);

          if (!MT_CLASS) {
            MT_CLASS = rb_cObject;
            MT_CLASS = rb_const_get(MT_CLASS, rb_intern("OSX"));
            MT_CLASS = rb_const_get(MT_CLASS, rb_intern("MultiTouch"));
          }

          rb_funcall(MT_CLASS, rb_intern("callback"), 0);
          --counter;

          return 0;
        }
      END

      c.c <<-'END'
        void start() {
          MTDeviceRef dev = MTDeviceCreateDefault();
          MTRegisterContactFrameCallback(dev, callback);
          MTDeviceStart(dev);
        }
      END

      c.c <<-'END'
        void stop() {
          MTDeviceStop(MTDeviceCreateDefault());
        }
      END
    end

    module_function :start, :stop

    def self.callback
      puts "I AM A JEDI"
    end
  end
end
