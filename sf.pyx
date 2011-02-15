# -*- python -*-
# -*- coding: utf-8 -*-

# Copyright 2011 Bastien Léonard. All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:

#    1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.

#    2. Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.

# THIS SOFTWARE IS PROVIDED BY BASTIEN LÉONARD ``AS IS'' AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BASTIEN LÉONARD OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
# USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.


"""Python wrapper for the C++ library SFML 2 (Simple and Fast
Multimedia Library)."""


import struct

try:
    import cStringIO as StringIO
except ImportError:
    import StringIO

from libc.stdlib cimport free
from libcpp.vector cimport vector
from cython.operator cimport preincrement as preinc, dereference as deref

cimport decl
cimport declevent
cimport decljoy
cimport declkey
cimport declmouse



# Forward declarations
cdef class RenderWindow




class PySFMLException(Exception):
    """Base class for the exceptions raised by PySFML."""


class FileLoadingException(PySFMLException):
    """Raised when a file can't be loaded."""




cdef class Mouse:
    LEFT = declmouse.Left
    RIGHT = declmouse.Right
    MIDDLE = declmouse.Middle
    X_BUTTON1 = declmouse.XButton1
    X_BUTTON2 = declmouse.XButton2
    BUTTON_COUNT = declmouse.ButtonCount



cdef class Joy:
    AXIS_X = decljoy.AxisX
    AXIS_Y = decljoy.AxisY
    AXIS_Z = decljoy.AxisZ
    AXIS_R = decljoy.AxisR
    AXIS_U = decljoy.AxisU
    AXIS_V = decljoy.AxisV
    AXIS_POV = decljoy.AxisPOV
    AXIS_COUNT = decljoy.AxisCount

    COUNT = decljoy.Count
    BUTTON_COUNT = decljoy.ButtonCount



cdef class Key:
    A = declkey.A
    B = declkey.B
    C = declkey.C
    D = declkey.D
    E = declkey.E
    F = declkey.F
    G = declkey.G
    H = declkey.H
    I = declkey.I
    J = declkey.J
    K = declkey.K
    L = declkey.L
    M = declkey.M
    N = declkey.N
    O = declkey.O
    P = declkey.P
    Q = declkey.Q
    R = declkey.R
    S = declkey.S
    T = declkey.T
    U = declkey.U
    V = declkey.V
    W = declkey.W
    X = declkey.X
    Y = declkey.Y
    Z = declkey.Z
    NUM0 = declkey.Num0
    NUM1 = declkey.Num1
    NUM2 = declkey.Num2
    NUM3 = declkey.Num3
    NUM4 = declkey.Num4
    NUM5 = declkey.Num5
    NUM6 = declkey.Num6
    NUM7 = declkey.Num7
    NUM8 = declkey.Num8
    NUM9 = declkey.Num9
    ESCAPE = declkey.Escape
    L_CONTROL = declkey.LControl
    L_SHIFT = declkey.LShift
    L_ALT = declkey.LAlt
    L_SYSTEM = declkey.LSystem
    R_CONTROL = declkey.RControl
    R_SHIFT = declkey.RShift
    R_ALT = declkey.RAlt
    R_SYSTEM = declkey.RSystem
    MENU = declkey.Menu
    L_BRACKET = declkey.LBracket
    R_BRACKET = declkey.RBracket
    SEMI_COLON = declkey.SemiColon
    COMMA = declkey.Comma
    PERIOD = declkey.Period
    QUOTE = declkey.Quote
    SLASH = declkey.Slash
    BACK_SLASH = declkey.BackSlash
    TILDE = declkey.Tilde
    EQUAL = declkey.Equal
    DASH = declkey.Dash
    SPACE = declkey.Space
    RETURN = declkey.Return
    BACK = declkey.Back
    TAB = declkey.Tab
    PAGE_UP = declkey.PageUp
    PAGE_DOWN = declkey.PageDown
    END = declkey.End
    HOME = declkey.Home
    INSERT = declkey.Insert
    DELETE = declkey.Delete
    ADD = declkey.Add
    SUBTRACT = declkey.Subtract
    MULTIPLY = declkey.Multiply
    DIVIDE = declkey.Divide
    LEFT = declkey.Left
    RIGHT = declkey.Right
    UP = declkey.Up
    DOWN = declkey.Down
    NUMPAD0 = declkey.Numpad0
    NUMPAD1 = declkey.Numpad1
    NUMPAD2 = declkey.Numpad2
    NUMPAD3 = declkey.Numpad3
    NUMPAD4 = declkey.Numpad4
    NUMPAD5 = declkey.Numpad5
    NUMPAD6 = declkey.Numpad6
    NUMPAD7 = declkey.Numpad7
    NUMPAD8 = declkey.Numpad8
    NUMPAD9 = declkey.Numpad9
    F1 = declkey.F1
    F2 = declkey.F2
    F3 = declkey.F3
    F4 = declkey.F4
    F5 = declkey.F5
    F6 = declkey.F6
    F7 = declkey.F7
    F8 = declkey.F8
    F9 = declkey.F9
    F10 = declkey.F10
    F11 = declkey.F11
    F12 = declkey.F12
    F13 = declkey.F13
    F14 = declkey.F14
    F15 = declkey.F15
    PAUSE = declkey.Pause
    COUNT = declkey.Count



cdef class IntRect:
    cdef decl.IntRect *p_this

    def __cinit__(self, int left=0, int top=0, int width=0, int height=0):
        self.p_this = new decl.IntRect(left, top, width, height)

    def __dealloc__(self):
        del self.p_this

    def __repr__(self):
        return ('IntRect(left={0.left!r}, top={0.top!r}, '
                'width={0.width!r}, height={0.height!r})'.format(self))

    property left:
        def __get__(self):
            return self.p_this.Left

    property top:
        def __get__(self):
            return self.p_this.Top

    property width:
        def __get__(self):
            return self.p_this.Width

    property height:
        def __get__(self):
            return self.p_this.Height

    def contains(self, int x, int y):
        return self.p_this.Contains(x, y)

    def intersects(self, IntRect rect, IntRect intersection=None):
        if intersection is None:
            return self.p_this.Intersects(rect.p_this[0])
        else:
            return self.p_this.Intersects(rect.p_this[0],
                                          intersection.p_this[0])


cdef decl.IntRect convert_to_int_rect(value):
    if isinstance(value, IntRect):
        return (<IntRect>value).p_this[0]

    if isinstance(value, tuple):
        return decl.IntRect(value[0], value[1], value[2], value[3])
    
    raise TypeError("Required IntRect or tuple, found {0}".format(type(value)))


cdef class FloatRect:
    cdef decl.FloatRect *p_this

    def __init__(self, float left=0, float top=0, float width=0,
                  float height=0):
        self.p_this = new decl.FloatRect(left, top, width, height)

    def __dealloc__(self):
        del self.p_this

    def __repr__(self):
        return ('FloatRect(left={0.left!r}, top={0.top!r}, '
                'width={0.width!r}, height={0.height!r})'.format(self))

    property left:
        def __get__(self):
            return self.p_this.Left

    property top:
        def __get__(self):
            return self.p_this.Top

    property width:
        def __get__(self):
            return self.p_this.Width

    property height:
        def __get__(self):
            return self.p_this.Height

    def contains(self, int x, int y):
        return self.p_this.Contains(x, y)

    def intersects(self, FloatRect rect, FloatRect intersection=None):
        if intersection is None:
            return self.p_this.Intersects(rect.p_this[0])
        else:
            return self.p_this.Intersects(rect.p_this[0],
                                          intersection.p_this[0])


cdef FloatRect wrap_float_rect_instance(decl.FloatRect *p_cpp_instance):
    cdef FloatRect ret = FloatRect.__new__(FloatRect)
    ret.p_this = p_cpp_instance

    return ret



cdef class Color:
    BLACK = Color(0, 0, 0)
    WHITE = Color(255, 255, 255)
    RED = Color(255, 0, 0)
    GREEN = Color(0, 255, 0)
    BLUE = Color(0, 0, 255)
    YELLOW = Color(255, 255, 0)
    MAGENTA = Color(255, 0, 255)
    CYAN = Color(0, 255, 255)

    cdef decl.Color *p_this

    def __init__(self, int r, int g, int b, int a=255):
        self.p_this = new decl.Color(r, g, b, a)

    def __dealloc__(self):
        del self.p_this

    def __repr__(self):
        return 'Color({0.r}, {0.g}, {0.b}, {0.a})'.format(self)

    def __richcmp__(Color x, Color y, int op):
        # ==
        if op == 2:
            return (x.r == y.r and
                    x.g == y.g and
                    x.b == y.b and
                    x.a == y.a)
        # !=
        elif op == 3:
            return not x == y

        return NotImplemented

    def __add__(Color x, Color y):
        return Color(min(x.r + y.r, 255),
                     min(x.g + y.g, 255),
                     min(x.b + y.b, 255),
                     min(x.a + y.a, 255))

    def __mul__(Color x, Color y):
        return Color(x.r * y.r / 255,
                     x.g * y.g / 255,
                     x.b * y.b / 255,
                     x.a * y.a / 255)

    property r:
        def __get__(self):
            return self.p_this.r

    property g:
        def __get__(self):
            return self.p_this.g

    property b:
        def __get__(self):
            return self.p_this.b

    property a:
        def __get__(self):
            return self.p_this.a


cdef wrap_color_instance(decl.Color *p_cpp_instance):
    cdef Color ret = Color.__new__(Color)
    ret.p_this = p_cpp_instance

    return ret



class Event:
    CLOSED = declevent.Closed
    RESIZED = declevent.Resized
    LOST_FOCUS = declevent.LostFocus
    GAINED_FOCUS = declevent.GainedFocus
    TEXT_ENTERED = declevent.TextEntered
    KEY_PRESSED = declevent.KeyPressed
    KEY_RELEASED = declevent.KeyReleased
    MOUSE_WHEEL_MOVED = declevent.MouseWheelMoved
    MOUSE_BUTTON_PRESSED = declevent.MouseButtonPressed
    MOUSE_BUTTON_RELEASED = declevent.MouseButtonReleased
    MOUSE_MOVED = declevent.MouseMoved
    MOUSE_ENTERED = declevent.MouseEntered
    MOUSE_LEFT = declevent.MouseLeft
    JOY_BUTTON_PRESSED = declevent.JoyButtonPressed
    JOY_BUTTON_RELEASED = declevent.JoyButtonReleased
    JOY_MOVED = declevent.JoyMoved
    COUNT = declevent.Count

    NAMES = {
        CLOSED: 'Closed',
        RESIZED: 'Resized',
        LOST_FOCUS: 'Lost focus',
        GAINED_FOCUS: 'Gained focus',
        TEXT_ENTERED: 'Text entered',
        KEY_PRESSED: 'Key pressed',
        KEY_RELEASED: 'Key released',
        MOUSE_WHEEL_MOVED: 'Mouse wheel moved',
        MOUSE_BUTTON_PRESSED: 'Mouse button pressed',
        MOUSE_BUTTON_RELEASED: 'Mouse button released',
        MOUSE_MOVED: 'Mouse moved',
        MOUSE_ENTERED: 'Mouse entered',
        MOUSE_LEFT: 'Mouse left',
        JOY_BUTTON_PRESSED: 'Joystick button pressed',
        JOY_BUTTON_RELEASED: 'Joystick button released',
        JOY_MOVED: 'Joystick moved'
        }

    def __str__(self):
        """Return a short description of the event."""

        return self.NAMES[self.type]


# Create an Python Event object that matches the C++ object
# by dynamically setting the corresponding attributes.
cdef wrap_event_instance(decl.Event *p_cpp_instance):
    cdef ret = Event()

    # Set the type
    if p_cpp_instance.Type == declevent.Closed:
        ret.type = Event.CLOSED
    elif p_cpp_instance.Type == declevent.KeyPressed:
        ret.type = Event.KEY_PRESSED
    elif p_cpp_instance.Type == declevent.KeyReleased:
        ret.type = Event.KEY_RELEASED
    elif p_cpp_instance.Type == declevent.Resized:
        ret.type = Event.RESIZED
    elif p_cpp_instance.Type == declevent.TextEntered:
        ret.type = Event.TEXT_ENTERED
    elif p_cpp_instance.Type == declevent.MouseButtonPressed:
        ret.type = Event.MOUSE_BUTTON_PRESSED
    elif p_cpp_instance.Type == declevent.MouseButtonReleased:
        ret.type = Event.MOUSE_BUTTON_RELEASED
    elif p_cpp_instance.Type == declevent.MouseMoved:
        ret.type = Event.MOUSE_MOVED
    elif p_cpp_instance.Type == declevent.LostFocus:
        ret.type = Event.LOST_FOCUS
    elif p_cpp_instance.Type == declevent.GainedFocus:
        ret.type = Event.GAINED_FOCUS
    elif p_cpp_instance.Type == declevent.MouseWheelMoved:
        ret.type = Event.MOUSE_WHEEL_MOVED
    elif p_cpp_instance.Type == declevent.MouseMoved:
        ret.type = Event.MOUSE_MOVED
    elif p_cpp_instance.Type == declevent.MouseEntered:
        ret.type = Event.MOUSE_ENTERED
    elif p_cpp_instance.Type == declevent.MouseLeft:
        ret.type = Event.MOUSE_LEFT
    elif p_cpp_instance.Type == declevent.JoyButtonPressed:
        ret.type = Event.JOY_BUTTON_PRESSED
    elif p_cpp_instance.Type == declevent.JoyButtonReleased:
        ret.type = Event.JOY_BUTTON_RELEASED
    elif p_cpp_instance.Type == declevent.JoyMoved:
        ret.type = Event.JOY_MOVED

    # Set other attributes if needed
    if p_cpp_instance.Type == declevent.Resized:
        ret.width = p_cpp_instance.Size.Width
        ret.height = p_cpp_instance.Size.Height
    elif (p_cpp_instance.Type == declevent.KeyPressed or
          p_cpp_instance.Type == declevent.KeyReleased):
        ret.code = p_cpp_instance.Key.Code
        ret.alt = p_cpp_instance.Key.Alt
        ret.control = p_cpp_instance.Key.Control
        ret.shift = p_cpp_instance.Key.Shift
    elif (p_cpp_instance.Type == declevent.MouseButtonPressed or
          p_cpp_instance.Type == declevent.MouseButtonReleased):
        ret.button = p_cpp_instance.MouseButton.Button
        ret.x = p_cpp_instance.MouseButton.X
        ret.y = p_cpp_instance.MouseButton.Y
    elif p_cpp_instance.Type == declevent.MouseMoved:
        ret.x = p_cpp_instance.MouseMove.X
        ret.y = p_cpp_instance.MouseMove.Y
    elif p_cpp_instance.Type == declevent.MouseWheelMoved:
        ret.delta = p_cpp_instance.MouseWheel.Delta
        ret.x = p_cpp_instance.MouseWheel.X
        ret.y = p_cpp_instance.MouseWheel.Y
    elif (p_cpp_instance.Type == declevent.JoyButtonPressed or
          p_cpp_instance.Type == declevent.JoyButtonReleased):
        ret.joystick_id = p_cpp_instance.JoyButton.JoystickId
        ret.button = p_cpp_instance.JoyButton.Button
    elif p_cpp_instance.Type == declevent.JoyMoved:
        ret.joystick_id = p_cpp_instance.JoyMove.JoystickId
        ret.axis = p_cpp_instance.JoyMove.Axis
        ret.position = p_cpp_instance.JoyMove.Position

    return ret


cdef class Image:
    cdef decl.Image *p_this

    def __init__(self, int width, int height, Color color=None):
        self.p_this = new decl.Image()

        if color is None:
            self.p_this.Create(width, height)
        else:
            self.p_this.Create(width, height, color.p_this[0])

    def __dealloc__(self):
        del self.p_this

    def __getitem__(self, tuple coords):
        x, y = coords

        return self.get_pixel(x, y)

    def __setitem__(self, tuple coords, Color color):
        x, y = coords

        self.set_pixel(x, y, color)

    property height:
        def __get__(self):
            return self.p_this.GetHeight()

    property smooth:
        def __get__(self):
            return self.p_this.IsSmooth()

        def __set__(self, bint value):
            self.p_this.SetSmooth(value)

    property width:
        def __get__(self):
            return self.p_this.GetWidth()

    @classmethod
    def load_from_file(cls, char *filename):
        cdef decl.Image *p_cpp_instance = new decl.Image()

        if p_cpp_instance.LoadFromFile(filename):
            return wrap_image_instance(p_cpp_instance)

        raise FileLoadingException()

    @classmethod
    def load_from_screen(cls, RenderWindow window, IntRect source_rect=None):
        """Return a new image with the screen content."""

        cdef decl.Image *p_cpp_instance = new decl.Image()
        cdef bint result = False

        if source_rect is None:
            result = p_cpp_instance.CopyScreen(window.p_this[0])
        else:
            result = p_cpp_instance.CopyScreen(window.p_this[0],
                                               source_rect.p_this[0])

        if result:
            return wrap_image_instance(p_cpp_instance)

        raise PySFMLException("Couldn't copy screen")

    @classmethod
    def load_from_memory(cls, char* mem):
        cdef decl.Image *p_cpp_instance = new decl.Image()

        if p_cpp_instance.LoadFromMemory(mem, len(mem)):
            return wrap_image_instance(p_cpp_instance)

        raise PySFMLException("Couldn't create image from memory")

    @classmethod
    def load_from_pixels(cls, int width, int height, char *pixels):
        cdef decl.Image *p_cpp_instance = new decl.Image()

        if p_cpp_instance.LoadFromPixels(width, height, <unsigned char*>pixels):
            return wrap_image_instance(p_cpp_instance)

        raise PySFMLException("Couldn't create image from pixels")

    @classmethod
    def get_maximum_size(cls):
        return decl.GetMaximumSize()

    def bind(self):
        self.p_this.Bind()

    def copy(self, Image source, int dest_x, int dest_y,
             source_rect=None, bint apply_alpha=None):
        cdef decl.IntRect cpp_source_rect

        if source_rect is None:
            self.p_this.Copy(source.p_this[0], dest_x, dest_y)
        else:
            if isinstance(source_rect, tuple):
                cpp_source_rect = decl.IntRect(source_rect[0],
                                               source_rect[1],
                                               source_rect[2],
                                               source_rect[3])
            elif isinstance(source_rect, IntRect):
                cpp_source_rect = (<IntRect>source_rect).p_this[0]
            else:
                raise TypeError('source_rect must be tuple or IntRect')

            if apply_alpha is None:
                self.p_this.Copy(source.p_this[0], dest_x, dest_y,
                                 cpp_source_rect)
            else:
                self.p_this.Copy(source.p_this[0], dest_x, dest_y,
                                 cpp_source_rect, apply_alpha)

    def create_mask_from_color(self, Color color, int alpha=0):
        self.p_this.CreateMaskFromColor(color.p_this[0], alpha)

    def get_pixel(self, int x, int y):
        cdef decl.Color *p_color = new decl.Color()
        cdef decl.Color temp = self.p_this.GetPixel(x, y)

        p_color[0] = temp

        return wrap_color_instance(p_color)

    def get_pixels(self):
        """Return a string containing the pixels of the image in RGBA fomat."""

        cdef decl.Uint8 *p = <decl.Uint8*>self.p_this.GetPixelsPtr()
        cdef int i = 0
        buf = StringIO.StringIO()
        packer = struct.Struct('B')

        while i < self.width * self.height * 4:
            buf.write(packer.pack(deref(p)))
            i += 1
            preinc(p)

        s = buf.getvalue()
        buf.close()

        return s

    def get_tex_coords(self, rect):
        cdef decl.IntRect cpp_rect = convert_to_int_rect(rect)
        cdef decl.FloatRect res = self.p_this.GetTexCoords(cpp_rect)
        cdef decl.FloatRect *p

        p[0] = res

        return wrap_float_rect_instance(p)

    def save_to_file(self, char* filename):
        self.p_this.SaveToFile(filename)

    def set_pixel(self, int x, int y, Color color):
        self.p_this.SetPixel(x, y, color.p_this[0])

    def update_pixels(self, char *pixels, rect=None):
        cdef decl.IntRect cpp_rect

        if rect is None:
            self.p_this.UpdatePixels(<unsigned char*>pixels)
        else:
            cpp_rect = convert_to_int_rect(rect)
            self.p_this.UpdatePixels(<unsigned char*>pixels, cpp_rect)


cdef Image wrap_image_instance(decl.Image *p_cpp_instance):
    cdef Image ret = Image.__new__(Image)
    ret.p_this = p_cpp_instance

    return ret




cdef class Drawable:
    cdef decl.Drawable *p_this

    def __cinit__(self, *args, **kwargs):
        pass

    def __init__(self, *args, **kwargs):
        if self.__class__ == Drawable:
            raise NotImplementedError('Drawable is abstact')



cdef class Sprite(Drawable):
    def __cinit__(self, Image image):
        self.p_this = <decl.Drawable*>new decl.Sprite(image.p_this[0])

    def __dealloc__(self):
        del self.p_this




cdef class VideoMode:
    cdef decl.VideoMode *p_this
    cdef bint delete_this

    def __cinit__(self, width=None, height=None, bits_per_pixel=32):
        if width is None or height is None:
            self.p_this = new decl.VideoMode()
        else:
            self.p_this = new decl.VideoMode(width, height, bits_per_pixel)

        self.delete_this = True

    def __dealloc__(self):
        if self.delete_this:
            del self.p_this

    def __str__(self):
        """Return a string about the mode in this format: WIDTHxHEIGHTxBPP.

        For example, '1024x768x32'."""

        return '{0.width}x{0.height}x{0.bits_per_pixel}'.format(self)

    def __repr__(self):
        return ('VideoMode({0.width}, {0.height}, {0.bits_per_pixel})'
                .format(self))

    def __richcmp__(VideoMode x, VideoMode y, int op):
        # ==
        if op == 2:
            return (x.width == y.width and
                    x.height == y.height and
                    x.bits_per_pixel == y.bits_per_pixel)
        # !=
        elif op == 3:
            return not x == y

        # <
        elif op == 0:
            if x.bits_per_pixel == y.bits_per_pixel:
                if x.width == y.width:
                    return x.height < y.height
                else:
                    return x.width < y.width
            else:
                return x.bits_per_pixel < y.bits_per_pixel
        # >
        elif op == 4:
            return y < x

        # <=
        elif op == 1:
            return not y < x
        # >=
        elif op == 5:
            return not x < y

        return NotImplemented

    property width:
        def __get__(self):
            return self.p_this.Width

    property height:
        def __get__(self):
            return self.p_this.Height

    property bits_per_pixel:
        def __get__(self):
            return self.p_this.BitsPerPixel

    @classmethod
    def get_desktop_mode(cls):
        cdef decl.VideoMode *p = new decl.VideoMode()
        p[0] = decl.GetDesktopMode()

        return wrap_video_mode_instance(p, True)

    @classmethod
    def get_fullscreen_modes(cls):
        cdef list ret = []
        cdef vector[decl.VideoMode] v = decl.GetFullscreenModes()
        cdef vector[decl.VideoMode].iterator it = v.begin()
        cdef decl.VideoMode current
        cdef decl.VideoMode *p_temp

        while it != v.end():
            current = deref(it)
            p_temp = new decl.VideoMode(current.Width, current.Height,
                                        current.BitsPerPixel)
            ret.append(wrap_video_mode_instance(p_temp, True))
            preinc(it)

        return ret

    def is_valid(self):
        return self.p_this.IsValid()


cdef VideoMode wrap_video_mode_instance(decl.VideoMode *p_cpp_instance,
                                        bint delete_this):
    cdef VideoMode ret = VideoMode.__new__(VideoMode)
    ret.p_this = p_cpp_instance
    ret.delete_this = delete_this

    return ret



cdef class RenderWindow:
    cdef decl.RenderWindow *p_this

    # Event returned when iterating on iter_events()
    cdef decl.Event *p_event

    def __cinit__(self, VideoMode mode, char* title):
        self.p_this = new decl.RenderWindow(mode.p_this[0], title)
        self.p_event = new decl.Event()

    def __dealloc__(self):
        del self.p_this

    def __iter__(self):
        return self

    def __next__(self):
        if self.p_this.GetEvent(self.p_event[0]):
            return wrap_event_instance(self.p_event)

        raise StopIteration

    property framerate_limit:
        def __set__(self, int value):
            self.p_this.SetFramerateLimit(value)

    def clear(self, Color color=None):
        if color is None:
            self.p_this.Clear()
        else:
            self.p_this.Clear(color.p_this[0])

    def close(self):
        self.p_this.Close()

    def display(self):
        self.p_this.Display()

    def draw(self, Drawable drawable):
        self.p_this.Draw(drawable.p_this[0])

    def iter_events(self):
        """Return an iterator which yields the current pending events.

        Warning: to avoid consistency problems, you should never
        modify the events obtained by this method. This is because it
        actually always gives the same Event instance, which is stored
        internally.

        Example::
        
            for event in window.iter_events():
                if event.type == sf.Event.CLOSED:
                    # ..."""

        return self